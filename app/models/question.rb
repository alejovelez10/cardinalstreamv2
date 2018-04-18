# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  event_id    :integer
#  account_id  :integer
#  name        :string
#  email       :string
#  description :text
#  affair      :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  date_time   :datetime
#

class Question < ApplicationRecord
	belongs_to :event
	
end
