class EventFile < ApplicationRecord
	mount_uploader :attachment, EventFileUploader
	belongs_to :event , inverse_of: :event_files
end
