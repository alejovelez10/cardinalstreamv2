Rails.application.routes.draw do
 



  resources :stats, :only => [:index,:create] do
  collection { post :import }

end

  get 'accounts/change_psw/:value/:id', to: "accounts#change_psw", as: "change_psw"
  get 'accounts/change_net/:value/:id', to: "accounts#change_net", as: "change_net"
  get 'accounts/change_questions/:value/:id', to: "accounts#change_questions", as: "change_questions"
  get 'accounts/change_docs/:value/:id', to: "accounts#change_docs", as: "change_docs"


  get 'event_info/record_live/:id', to: "events#record_live", as: "record_live"
  get 'event_info/public_live/:id', to: "events#public_live", as: "public_live"

  delete 'delete_question/:id', to: "questions#delete_question", as: "delete_question"
  delete 'delete_viewer/:id', to: "viewers#delete_viewer", as: "delete_viewer"
  get 'real_time_stats/get_statics/:id', to: 'accounts#get_statics', as: 'get_statics'


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
  post 'accounts/cardinalchat' ,to: "accounts#cardinalchat", as: "cardinalchat"



  resources :events , :only => [:index, :show, :create, :update, :edit, :destroy]
  get 'edit_more/:id/:type' , to: "events#edit" , as: "edit_more"
  get 'event_info/:id', to: "events#event_info", as: "event_info" 

  get 'new/:state' , to: "events#new" , as: "new_event"
  get 'home', to: 'home#index', as: "home"
  resources :accounts
  devise_for :users, controllers: { registrations: "registrations" }

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
  get '*path' => redirect('/portal')
end


