Rails.application.routes.draw do
  get 'dashboards/index'

  get 'dashboards/setting'

  resources :onlines

  root to: 'visitors#index'

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords',
    invitations: 'users/invitations',
  }

  namespace :app do
    resources :users
    resources :advertisements do
      member do
        post :interest
        post :comment
        post :set_private_chat
      end
    end
  end

  namespace :admin do
    resources :users
    resources :advertisements
  end
end
