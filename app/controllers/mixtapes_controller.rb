class MixtapesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_mixtape, only: %i[show edit update destroy]

  def index
    @mixtapes = Mixtape.published
  end

  def show; end

  def new
    @mixtape = Mixtape.new
  end

  def edit; end

  def create
    @mixtape = Mixtape.new mixtape_params

    if @mixtape.save
      redirect_to @mixtape, notice: 'Mixtape was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @mixtape.update mixtape_params
      redirect_to @mixtape, notice: 'Mixtape was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mixtape.destroy!

    redirect_to :mixtapes, notice: 'Mixtape was successfully destroyed.'
  end

  private

  def set_mixtape
    @mixtape = Mixtape.find(params[:id])
  end

  def mixtape_params
    params
      .require(:mixtape)
      .permit :description,
              :image,
              :published_at,
              :slug,
              :subtitle,
              :title,
              :user_id,
              :visibility
  end
end
