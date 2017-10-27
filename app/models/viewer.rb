# == Schema Information
#
# Table name: viewers
#
#  id         :integer          not null, primary key
#  email      :string(100)
#  name       :string(100)
#  altitud    :string
#  longitud   :string
#  ciudad     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  company    :string
#  event_id   :integer
#  account_id :integer
#

class Viewer < ApplicationRecord
	belongs_to :event
	belongs_to :account
end
