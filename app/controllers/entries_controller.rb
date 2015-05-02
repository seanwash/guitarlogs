class EntriesController < ApplicationController
  def index
    @entries = Entry.all.order('created_at DESC')
  end

  def new
    @entry = Entry.new
  end

  def create
    @entry = Entry.new entry_params

    if @entry.save!
      redirect_to entries_path, notice: 'Entry saved!'
    else
      render :edit
    end
  end

  def show
    @entry = Entry.find params[:id]
  end

  def edit
    @entry = Entry.find params[:id]
  end

  def update
    @entry = Entry.find params[:id]

    if @entry.update_attributes entry_params
      redirect_to entries_path, notice: 'Entry Updated!'
    else
      render :edit
    end
  end

  def destroy
    @entry = Entry.find params[:id]

    if @entry.destroy
      redirect_to entries_path, notice: 'Entry Deleted!'
    else
      redirect_to entries_path
    end
  end

  private

  def entry_params
    params.require(:entry).permit(
      :content
    )
  end
end
