# == Schema Information
#
# Table name: rols
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  admin_user   :integer
#  name         :string
#  description  :text
#  create_event :boolean
#  edit_event   :boolean
#  delete_event :boolean
#  admin_event  :boolean
#  admin_stats  :boolean
#  admin_config :boolean
#  admin_users  :boolean
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  default      :boolean
#  rol          :boolean
#

class Rol < ApplicationRecord
	has_many :rols
end
