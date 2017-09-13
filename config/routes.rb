Rails.application.routes.draw do
 
  resources :events
  get 'home/index'
  resources :accounts
  devise_for :users

  match '/', to: 'accounts#index', constraints: { subdomain: 'www' }, via: [:get, :post, :put, :patch, :delete]
  match '/', to: 'accounts#show', constraints: { subdomain: /.+/ }, via: [:get, :post, :put, :patch, :delete]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

 root 'accounts#index'

end


