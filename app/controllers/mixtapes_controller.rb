class MixtapesController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  before_action      :set_user
  before_action      :set_mixtape,        only: %i[edit update destroy]

  def index
    @mixtapes = Mixtape.published
  end

  def show
    # TODO: expand this to show secret mixtapes with secret URL
    #       or archived/draft if owned by current user.
    #       published for anyone.
    @mixtape = @user.mixtapes.find_by(slug: params[:slug])
  end

  def new
  end

  def edit; end

  def create
    @mixtape = Current.user.mixtapes.new mixtape_params

    if @mixtape.save
      redirect_to @mixtape.path, notice: 'Mixtape was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @mixtape.update mixtape_params
      redirect_to @mixtape.path, notice: 'Mixtape was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @mixtape.destroy!

    redirect_to :mixtapes, notice: 'Mixtape was successfully destroyed.'
  end

  private

  def set_user
    @user = User.find_by(username: params[:username])
  end

  def set_mixtape
    @mixtape = Current.user.mixtapes.find_by(slug: params[:slug])
  end

  def mixtape_params
    params
      .require(:mixtape)
      .permit :cover,
              :description,
              :published_at,
              :slug,
              :subtitle,
              :title,
              :user_id,
              :visibility
  end
end
