json.extract! event, :id, :date_event, :name, :description, :state, :backgroud_event, :video, :ppts, :user_id, :admin_user, :account_id, :created_at, :updated_at
json.url event_url(event, format: :json)
