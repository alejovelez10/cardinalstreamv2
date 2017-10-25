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
#

class Event < ApplicationRecord
	belongs_to :account
	mount_uploader :ppts, PpptUploader
	mount_uploader :video, VideoUploader
  mount_uploader :video_p, VideopEventUploader
  
	after_save :root_event_change
	has_many :ask_emails , inverse_of: :event, dependent: :destroy
	has_many :event_files , inverse_of: :event, dependent: :destroy
  

  accepts_nested_attributes_for :ask_emails, :allow_destroy => true
  accepts_nested_attributes_for :event_files, :allow_destroy => true



        def root_event_change

            if self.root_event
              
              Event.where(admin_user: self.admin_user).where.not(id: self.id).update_all(root_event: false)
              
                
            end  
              
        end       
end
