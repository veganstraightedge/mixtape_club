class CoversController < ApplicationController
  before_action :set_mixtape

  def destroy
    @mixtape.cover.purge

    redirect_to @mixtape, status: 303
  end

  private

  def set_mixtape
    @mixtape = Current.user.mixtapes.find(params[:mixtape_id])
  end
end
