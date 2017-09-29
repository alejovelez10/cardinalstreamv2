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
#

class Account < ApplicationRecord
	has_many :events
	mount_uploader :logo, AccountLogoUploader
	mount_uploader :background_stream, AccountBackgroundUploader
	mount_uploader :background_portal, BackgroundPortalUploader

end
