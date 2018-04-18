# == Schema Information
#
# Table name: accounts
#
#  id                :integer          not null, primary key
#  domain            :string
#  logo              :string
#  admin_user        :integer
#  user_id           :integer
#  background_portal :string
#  background_stream :string
#  name              :string
#  questions         :boolean
#  download_docs     :boolean
#  chat              :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  facebook          :string
#  instagram         :string
#  twitter           :string
#  linkedin          :string
#  psw               :string
#  has_psw           :boolean
#  has_networks      :boolean
#  requisitos        :string
#

class Account < ApplicationRecord
	has_many :events
	has_many :stats
	
	has_many :viewers
	mount_uploader :logo, AccountLogoUploader
	mount_uploader :background_stream, AccountBackgroundUploader
	mount_uploader :background_portal, BackgroundPortalUploader
	mount_uploader :requisitos, RequisitosUploader

end
