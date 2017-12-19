Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  namespace :member do
    root to: 'home#index'
    resources :sessions, only: [:new, :create, :destroy]
    resources :home
    match '/images/:image', to: "sessions#showpic", via: "get", as: :renderpic

  end


  namespace :admin do
    root to: 'home#index'
    resources :sessions, only: [:new, :create, :destroy]
    resources :home
  end
end
