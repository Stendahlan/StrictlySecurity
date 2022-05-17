Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)

  #resources :users, only: [:new, :create, :index]

  #get 'login', to: 'sessions#new'

  #post 'login', to: 'sessions#create'

  #get 'welcome', to: 'sessions#welcome'

  #get 'authorized', to: 'sessions#page_requires_login'


end
