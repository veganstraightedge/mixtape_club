class MixtapesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action      :set_mixtape,        only: %i[edit update destroy]

  def index
    @mixtapes = Mixtape.published
  end

  def show
    # TODO: expand this to show secret mixtapes with secret URL
    #       or archived/draft if owned by current user.
    #       published for anyone.
    @mixtape = Mixtape.find(params[:id])
  end

  def new
    @mixtape = Current.user.mixtapes.new

    @draft_mixtapes     = Current.user.mixtapes.draft
    @secret_mixtapes    = Current.user.mixtapes.secret
    @published_mixtapes = Current.user.mixtapes.published
    @archived_mixtapes  = Current.user.mixtapes.archived
  end

  def edit; end

  def create
    @mixtape = Current.user.mixtapes.new mixtape_params

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
    @mixtape = Current.user.mixtapes.find(params[:id])
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
