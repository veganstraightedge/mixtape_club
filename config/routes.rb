Rails.application.routes.draw do
  get 'up', to: 'rails/health#show', as: :rails_health_check

  root 'home#index'

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

    get 'settings/account', to: 'devise/registrations#edit', as: :account_settings
  end
end
