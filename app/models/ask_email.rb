class AskEmail < ApplicationRecord
	belongs_to :event , inverse_of: :ask_emails

end
