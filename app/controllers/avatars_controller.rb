class AvatarsController < ApplicationController
  def destroy
    return unless Current.user.avatar.attached?

    Current.user.avatar.purge

    redirect_to :settings
  end
end
