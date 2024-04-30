Rails.application.routes.draw do
  # Authentication
  devise_for :user,
             path:       '/',
             path_names: {
               confirmation: 'confirm',
               password:     'reset',
               registration: 'register',
               sign_in:      'signin',
               sign_up:      'signup',
               sign_out:     'signout'
             }

  # Prettier authentication routes
  devise_scope :user do
    get 'signup',  to: 'devise/registrations#new'
    get 'signin',  to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy'
    get 'forgot',  to: 'devise/passwords#new'

    get 'settings/account', to: 'devise/registrations#edit', as: :account_settings
  end

  # Homepage for signed-in users
  unauthenticated do
    root 'home#index'
  end

  # Homepage for not signed-in users
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  # Profile
  get '@:username', to: 'users#show', as: :profile
  get '@',          to: redirect('profile')
  get 'users/:id',  to: redirect('profile')
  get 'profile',    to: 'users#show'

  # Users
  resources :users, only: :update
  get 'settings',               to: redirect('settings/profile'), as: :settings
  get 'settings/profile',       to: 'settings#profile',           as: :profile_settings

  # Administrivia
  get 'terms',   to: 'about#terms',   as: :terms
  get 'privacy', to: 'about#privacy', as: :privacy

  # Health check page
  get 'up', to: 'rails/health#show', as: :rails_health_check
end
