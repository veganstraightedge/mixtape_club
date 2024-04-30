class SettingsController < ApplicationController
  def account
    # /settings/account is handled by Devise’s RegistrationsController#edit
  end

  def profile
    @title = 'Settings : Profile'
  end
end
