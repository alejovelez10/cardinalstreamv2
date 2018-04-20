Rails.application.routes.draw do




  resources :rols
  resources :stats, :only => [:index,:create] do
  collection { post :import }

end

  get 'accounts/change_psw/:value/:id', to: "accounts#change_psw", as: "change_psw"
  get 'accounts/change_net/:value/:id', to: "accounts#change_net", as: "change_net"
  get 'accounts/change_questions/:value/:id', to: "accounts#change_questions", as: "change_questions"
  get 'accounts/change_docs/:value/:id', to: "accounts#change_docs", as: "change_docs"


  get 'events/record_live/:id', to: "events#record_live", as: "record_live"
  get 'events/public_live/:id', to: "events#public_live", as: "public_live"
  get 'events/stop_record_live/:id', to: "events#stop_record_live", as: "stop_record_live"
  
  post 'create_file', to: 'events#create_file', as: 'create_file'


  delete 'delete_question/:id', to: "questions#delete_question", as: "delete_question"
  delete 'delete_viewer/:id', to: "viewers#delete_viewer", as: "delete_viewer"
  get 'real_time_stats/get_statics/:id', to: 'accounts#get_statics', as: 'get_statics'
  get 'events/get_event_statics/:id', to: 'events#get_event_statics', as: 'get_event_statics'
  get 'real_time_stats/get_users_conenected/:id', to: 'accounts#get_users_conenected', as: 'get_users_conenected'


  get 'stats/index'
  get 'stats/csv'
  get 'stats/csv_all'
  get 'portal_show/create/:id/:type', to: 'stats#create'
  post 'portal_login', to: 'accounts#portal_login', as: "portal_login"
  get 'viewer_sessions/new'

  get 'login', to: 'viewer_sessions#new'
  post 'login', to: 'viewers_sessions#create'
  delete 'logout/:event_id', to: 'viewer_sessions#destroy', as: "logout"

  resources :viewers
  post 'create_viewer', to: "viewers#create_viewer", as: "create_viewer"
  get 'events/cardinalppt/:id/:id_event' ,to: "events#cardinalppt", as: "cardinalppt"

  get 'events/cardinalmsg' ,to: "events#cardinalmsg", as: "cardinalmsg"

  get 'events/cardinal_state/:state/:id' ,to: "events#cardinal_state", as: "cardinal_state"
  post 'accounts/cardinalchat' ,to: "accounts#cardinalchat", as: "cardinalchat"



  resources :events , :only => [:index, :show, :create, :update, :edit, :destroy]
  get 'edit_more/:id/:type' , to: "events#edit" , as: "edit_more"
  get 'event_info/:id', to: "events#event_info", as: "event_info"

  get 'new/:state' , to: "events#new" , as: "new_event"
  get 'home', to: 'home#index', as: "home"
  resources :accounts
  devise_for :users, controllers: { registrations: "registrations" }
  
  devise_scope :user do 
    get "users/index", to: "users/views#index", as: "users_index"
    get '/users/new', to: 'users/views#new_user', as: "new_user"
    post "create_user", to: "users/views#create_user", as: "create_user"
    get '/users/:id/edit', to: 'users/views#edit_user', as: "edit_user"
    post "/users/update_user/edit", to: "users/views#update_user", as: "update_user"
    delete "delete_user/:id", to: "users/views#delete_user", as: "delete_user"

  end

  #match '/', to: 'accounts#index', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
  #match '/', to: 'accounts#show', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  match '/', to: 'accounts#live', constraints: { subdomain: /.+/ }, via: [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'portal', to:"accounts#portal", as: "portal"
  get 'real_time_stats/:id', to:"accounts#real_time_stats", as: "real_time_stats"
  get 'portal_show/:id', to:"accounts#portal_show", as: "portal_show"
  get 'show_video/:id', to:"accounts#portal_show_video", as: "portal_show_video"
  get  'admin' , to: "events#index"
  get  'ppts/views/:id' , to: "events#ppts_views" , as: "ppts_views"
  post   'sinc_ppts', to: "events#sinc_ppts", as: "sinc_ppts"
  get 'admin', to: 'events#admin', as: "admin_events"
  get 'events_live', to: 'events#events_live', as: "events_live"
  get 'events_ondemand', to: 'events#events_ondemand', as: "events_ondemand"
  root 'events#index'
  get 'redir', to: 'home#redir', as: 'redir'
  post 'create_question', to: 'questions#create_question', as: 'create_question'
  get 'iframe/:iframe', to:"accounts#iframe", as: "iframe"
  get '/:name', to: "accounts#portal_show_name"

  get 'accounts/change_view/:view', to: "accounts#change_view", as: 'change_view'

  get 'loaderio-3c2889274396b9886e8bef0dcc80e3df.txt', to: "accounts#loader"

  get '*path' => redirect('/portal')
end
