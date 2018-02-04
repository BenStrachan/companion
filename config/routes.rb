Rails.application.routes.draw do
  get 'dashboards/index'

  get 'dashboards/setting'

  resources :advertisements
  root to: 'visitors#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    invitations: 'users/invitations',
  }

  namespace :app do
    resources :users
    resources :onlines
  end

  namespace :admin do
    resources :users
  end
end
