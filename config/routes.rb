Rails.application.routes.draw do
  # Auth
  devise_for :user,
             path:        '/',
             path_names:  {
               confirmation: 'confirm',
               password:     'reset',
               registration: 'register',
               sign_in:      'signin',
               sign_up:      'signup',
               sign_out:     'signout'
             }

  devise_scope :user do
    get 'signup',  to: 'devise/registrations#new'
    get 'signin',  to: 'devise/sessions#new'
    get 'signout', to: 'devise/sessions#destroy'
    get 'forgot',  to: 'devise/passwords#new'
  end

  # Homepage for signed-in users
  unauthenticated do
    root 'home#index'
  end

  # Homepage for not signed-in users
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  # Health check page
  get 'up', to: 'rails/health#show', as: :rails_health_check
end
