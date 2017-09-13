json.extract! account, :id, :domain, :logo, :admin_user, :user_id, :background_portal, :background_stream, :name, :questions, :download_docs, :chat, :created_at, :updated_at
json.url account_url(account, format: :json)
