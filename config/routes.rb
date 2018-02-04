Rails.application.routes.draw do
  get 'dashboards/index'

  get 'dashboards/setting'

  get 'onlines/index'

  resources :advertisements
  root to: 'visitors#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    invitations: 'users/invitations',
  }

  namespace :admin do
    resources :users
  end
end
