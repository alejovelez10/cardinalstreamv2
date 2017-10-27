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
#

class Question < ApplicationRecord
	belongs_to :event
	belongs_to :account
end
