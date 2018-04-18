# == Schema Information
#
# Table name: live_stats
#
#  id           :integer          not null, primary key
#  type_stat    :integer
#  event_id     :integer
#  account_id   :integer
#  event_name   :string
#  account_name :string
#  day          :integer
#  month        :integer
#  year         :integer
#  hour         :integer
#  minute       :integer
#  second       :integer
#  time_stat    :datetime
#  state_date   :date
#  state_time   :time
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class LiveStat < ApplicationRecord
	belongs_to :event
end



