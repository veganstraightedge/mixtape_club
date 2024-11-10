Rails.application.routes.draw do
  resources :audios
  resources :images
  resources :entries

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

  # Homepage for not signed-in users
  unauthenticated do
    root to: 'home#index'
  end

  # Homepage for signed-in users
  authenticated :user do
    root to: 'dashboard#index', as: :dashboard
  end

  # Profile
  get '@:username', to: 'users#show', as: :profile
  get '@',          to: redirect('profile')
  get 'users/:id',  to: redirect('profile')
  get 'profile',    to: 'users#show'

  # Users
  resources :users, only: :update
  get 'settings',         to: redirect('settings/profile'), as: :settings
  get 'settings/profile', to: 'settings#profile',           as: :profile_settings

  # Avatar delete button
  resource :avatar, only: :destroy

  # Mixtapes
  ## Custom routes and redirect
  get 'mixtapes',         to: redirect('explore'), as: :mixtapes
  get 'explore',          to: 'mixtapes#index',    as: :explore
  get 'mixtapes/new',     to: redirect('/'),       as: :new_mixtape

  ## CRUD
  get    '@:username/:slug',     to: 'mixtapes#show', as: :mixtape
  post   '@:username/:mixtapes', to: 'mixtapes#create'
  patch  '@:username/:slug',     to: 'mixtapes#update'
  put    '@:username/:slug',     to: 'mixtapes#update'
  delete '@:username/:slug',     to: 'mixtapes#destroy'

  resources :mixtapes, param: :slug, except: %i[index show new] do
    resource :cover, only: :destroy
  end

  # Administrivia
  get 'terms',   to: 'about#terms',   as: :terms
  get 'privacy', to: 'about#privacy', as: :privacy

  # Health check page
  get 'up', to: 'rails/health#show', as: :rails_health_check
end
