Rails.application.routes.draw do
 

  get 'events/cardinalppt/:id' ,to: "events#cardinalppt", as: "cardinalppt"
  resources :events
  get 'home', to: 'home#index', as: "home"
  resources :accounts
  devise_for :users

  #match '/', to: 'accounts#index', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
  #match '/', to: 'accounts#show', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  match '/', to: 'accounts#live', constraints: { subdomain: /.+/ }, via: [:get]

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  get 'portal', to:"accounts#portal", as: "portal"
  get 'portal/:id', to:"accounts#portal_show", as: "portal_show"
  get  'admin' , to: "events#index"

  root 'events#index'
 

end


