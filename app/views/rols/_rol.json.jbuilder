json.extract! rol, :id, :user_id, :admin_user, :name, :description, :create_event, :edit_event, :delete_event, :admin_event, :admin_stats, :admin_config, :admin_users, :created_at, :updated_at
json.url rol_url(rol, format: :json)
