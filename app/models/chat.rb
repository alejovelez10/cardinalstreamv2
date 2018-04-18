# == Schema Information
#
# Table name: chats
#
#  id         :integer          not null, primary key
#  event_id   :integer
#  name       :string
#  message    :text
#  company    :string
#  email      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  viewer_id  :integer
#  date_time  :datetime
#

class Chat < ApplicationRecord
	belongs_to :event
end
