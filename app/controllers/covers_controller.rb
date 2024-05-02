class CoversController < ApplicationController
  def destroy
    @mixtape.cover.purge

    redirect_to @mixtape
  end

  private

  def set_mixtape
    @mixtape = Current.user.mixtapes.find(params[:id])
  end
end
