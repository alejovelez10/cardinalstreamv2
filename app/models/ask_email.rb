# == Schema Information
#
# Table name: ask_emails
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  admin_user :integer
#  event_id   :integer
#  account_id :integer
#  email      :string
#  comment    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class AskEmail < ApplicationRecord
	belongs_to :event , inverse_of: :ask_emails

end
