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

require 'test_helper'

class AccountTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
