# == Schema Information
#
# Table name: event_files
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  admin_user :integer
#  event_id   :integer
#  account_id :integer
#  name       :string
#  attachment :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class EventFile < ApplicationRecord
	mount_uploader :attachment, EventFileUploader
	belongs_to :event , inverse_of: :event_files
end
