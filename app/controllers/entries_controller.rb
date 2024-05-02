class EntriesController < ApplicationController
  before_action :set_entry, only: %i[show edit update destroy]

  def index
    @entries = Entry.all
  end

  def show; end

  def new
    @entry = Entry.new
  end

  def edit; end

  def create
    @entry = Entry.new(entry_params)

    if @entry.save
      redirect_to entry_url(@entry), notice: 'Entry was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @entry.update(entry_params)
      redirect_to entry_url(@entry), notice: 'Entry was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @entry.destroy!

    redirect_to entries_url, notice: 'Entry was successfully destroyed.'
  end

  private

  def set_entry
    @entry = Entry.find(params[:id])
  end

  def entry_params
    params
      .require(:entry)
      .permit :attribution_creator_name,
              :attribution_url,
              :attribution_via_name,
              :attribution_via_url,
              :description,
              :entryable_id,
              :entryable_type,
              :mixtape_id,
              :position,
              :subtitle,
              :title,
              :user_id
  end
end
