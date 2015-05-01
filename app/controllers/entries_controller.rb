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
  end

  def update
  end

  def destroy
  end

  private

  def entry_params
    params.require(:entry).permit(
      :content
    )
  end
end
