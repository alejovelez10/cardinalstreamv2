# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  name            :string
#  description     :text
#  state           :integer
#  backgroud_event :string
#  video           :string
#  ppts            :string
#  user_id         :integer
#  admin_user      :integer
#  account_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  slides          :text
#  sync            :text
#  type            :boolean
#  event_type      :boolean
#  event_date      :datetime
#  root_event      :boolean
#  delay           :integer
#  iframe          :string
#  has_ppts        :boolean
#  has_register    :boolean
#  social          :boolean
#  has_files       :boolean
#  has_question    :boolean
#  video_p         :string
#  ultimate_ppt    :integer
#  link            :string
#  views           :integer
#

class Event < ApplicationRecord
	belongs_to :account
  has_many :chats
  has_many :stats
  has_many :viewers
  has_many :questions
	mount_uploader :ppts, PpptUploader
	mount_uploader :video, VideoUploader
  mount_uploader :video_p, VideopEventUploader
  
	after_save :root_event_change
	has_many :ask_emails , inverse_of: :event, dependent: :destroy
	has_many :event_files , inverse_of: :event, dependent: :destroy
  

  accepts_nested_attributes_for :ask_emails, :allow_destroy => true
  accepts_nested_attributes_for :event_files, :allow_destroy => true


        def self.search(search)
                            where(['name LIKE ?', "%#{search}%"])
            
             
        end

        def root_event_change

            if self.root_event
              
              Event.where(admin_user: self.admin_user).where.not(id: self.id).update_all(root_event: false)
              
                
            end  
              
        end  


        def self.to_csv()
          attributes = %w{Nombre Vistas Vistas_Mitad}
            CSV.generate(headers: true) do |csv|
              csv <<  attributes
              all.each do |event|
               csv << attributes.map{ |attr| event.send(attr) }
              end
            end
        end  
      
      def Vistas_Mitad
          "#{stats.where(type_stat: 1).count}"
        end
        def Nombre
          "#{name}"
        end
        def Vistas
          "#{views}"
        end

          
end

