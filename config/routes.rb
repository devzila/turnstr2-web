Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'index#index'
  resources :story, only: [:show]
  namespace :member do
    root to: 'home#index'
    resource :sessions, only: [:new, :create, :destroy]
    resources :home

  end


  namespace :admin do
    root to: 'home#index'
    resource :sessions, only: [:new, :create, :destroy]
    resources :home
    resources :members
    put 'members/:id/update', to:'members#update'
    resources :stories
    resources :videos
    resources :photos
    resources :comments
    resource :settings
    resource :downloads
  end

  get "/:page" => "static#show"
end
