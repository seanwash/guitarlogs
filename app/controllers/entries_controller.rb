class EntriesController < ApplicationController
  before_filter :authorize

  def index
    @entries = current_user.entries.order('created_at DESC')
  end

  def new
    @entry = Entry.new
  end

  def create
    # Sanitize tags first
    if params[:entry][:tag_ids]
      params[:entry][:tag_ids] = sanitize_tags(params[:entry][:tag_ids])
    end

    # Create new entry after tags have been sanitized
    @entry = Entry.new entry_params

    # Assign this entry a journal
    @entry.journal = current_user.journal

    if @entry.save
      redirect_to entries_path, flash: { success: 'Entry saved!' }
    else
      render :new
    end
  end

  def show
    @entry = Entry.find params[:id]
  end

  def edit
    @entry = Entry.find params[:id]
  end

  def update
    # Sanitize tags first
    if params[:entry][:tag_ids]
      params[:entry][:tag_ids] = sanitize_tags(params[:entry][:tag_ids])
    end

    # Create new entry after tags have been sanitized
    @entry = Entry.find params[:id]

    if @entry.update_attributes entry_params
      redirect_to entries_path, flash: { success: 'Entry Updated!' }
    else
      render :edit
    end
  end

  def destroy
    @entry = Entry.find params[:id]

    if @entry.destroy
      redirect_to entries_path, flash: { success: 'Entry Deleted!' }
    else
      redirect_to entries_path
    end
  end

  private

  def entry_params
    params.require(:entry).permit(
      :content,
      {tag_ids: []}
    )
  end
end
