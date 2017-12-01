# == Schema Information
#
# Table name: stats
#
#  id           :integer          not null, primary key
#  event_id     :integer
#  account_id   :integer
#  event_name   :string
#  account_name :string
#  day          :string
#  month        :string
#  year         :string
#  hour         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  type_stat    :integer
#  time_stat    :datetime
#  minute       :integer
#  second       :integer
#

class Stat < ApplicationRecord
    belongs_to :event
    belongs_to :account



       def self.to_csv()
          attributes = %w{Evento Dia Mes Ano Hora Minuto Segundo Fecha_Hora}
            CSV.generate(headers: true) do |csv|
              csv <<  attributes
              all.each do |stat|
               csv << attributes.map{ |attr| stat.send(attr) }
              end
            end
        end  
        
        def Evento
          "#{event_name}"
        end
        def Dia
          "#{day}"
        end
        def Mes
          "#{month}"
        end
        def Ano
          "#{year}"
        end
        def Hora
          "#{hour}"
        end
        def Minuto
          "#{minute}"
        end
        def Segundo
          "#{second}"
        end
        def Fecha_Hora
          "#{time_stat}"
        end


        def self.import(file, admin_user ,user_id)
        spreadsheet = Roo::Spreadsheet.open(file.path)
        header = spreadsheet.row(1)
        (2..spreadsheet.last_row).each do |i|
         row = Hash[[header, spreadsheet.row(i)].transpose]
         stat = find_by(id: row["id"]) || new
         stat.attributes = row.to_hash
         stat.admin_user = admin_user
         stat.save!
        end
      end

      def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
      when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
      when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
      when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
        else raise "Unknown file type: #{file.original_filename}"
        end
      end


end
