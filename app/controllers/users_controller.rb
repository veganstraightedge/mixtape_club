class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  # /@profile
  def show
    if Current.user.present? && request.path == '/profile'
      return redirect_to Current.user.path
    end

    @user = User.find_by username: params[:username]

    redirect_to :root if @user.blank?
  end

  # /settings
  def update
    form_name = params[:form_name]

    if Current.user.update(user_params)
      redirect_to Current.user.path, notice: "#{form_name.capitalize} settings saved."
    else
      render "/settings/#{form_name}"
    end
  end

  private

  def user_params
    params
      .require(:user)
      .permit(
        :avatar,
        :bio,
        :email,
        :location,
        :name,
        :password,
        :password_confirmation,
        :pronouns,
        :username
      )
  end
end
