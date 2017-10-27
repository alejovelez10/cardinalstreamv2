# == Schema Information
#
# Table name: stats
#
#  id           :integer          not null, primary key
#  event_id     :integer
#  account_id   :integer
#  event_name   :string
#  account_name :string
#  day          :string
#  month        :string
#  year         :string
#  hour         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  type_stat    :integer
#  time_stat    :datetime
#

class Stat < ApplicationRecord
    belongs_to :event
    belongs_to :account
end
