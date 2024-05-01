class MixtapesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action :set_mixtape, only: %i[show edit update destroy]

  def index
    @mixtapes = Mixtape.all
  end

  def show; end

  def new
    @mixtape = Mixtape.new
  end

  def edit; end

  def create
    @mixtape = Mixtape.new(mixtape_params)

    respond_to do |format|
      if @mixtape.save
        format.html { redirect_to mixtape_url(@mixtape), notice: 'Mixtape was successfully created.' }
        format.json { render :show, status: :created, location: @mixtape }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mixtape.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @mixtape.update(mixtape_params)
        format.html { redirect_to mixtape_url(@mixtape), notice: 'Mixtape was successfully updated.' }
        format.json { render :show, status: :ok, location: @mixtape }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mixtape.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @mixtape.destroy!

    respond_to do |format|
      format.html { redirect_to mixtapes_url, notice: 'Mixtape was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_mixtape
    @mixtape = Mixtape.find(params[:id])
  end

  def mixtape_params
    params
      .require(:mixtape)
      .permit :user_id,
              :title,
              :subtitle,
              :slug,
              :description,
              :visibility,
              :published_at
  end
end
