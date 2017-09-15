# == Schema Information
#
# Table name: events
#
#  id              :integer          not null, primary key
#  date_event      :time
#  name            :string
#  description     :text
#  state           :integer
#  backgroud_event :string
#  video           :string
#  ppts            :string
#  user_id         :integer
#  admin_user      :integer
#  account_id      :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'test_helper'

class EventTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
