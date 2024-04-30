class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: :show

  # /@profile
  def show
    return redirect_to Current.user.path if request.path == '/profile'

    @user = User.find_by username: params[:username]

    redirect_to :root if @user.blank?
  end
end
