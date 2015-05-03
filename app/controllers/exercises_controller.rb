class ExercisesController < ApplicationController
  before_filter :authorize

  def index
    @exercises = Exercise.all.order 'created_at DESC'
  end

  def new
    @exercise = Exercise.new
  end

  def create
    # Sanitize tags first
    if params[:exercise][:tag_ids]
      params[:exercise][:tag_ids] = sanitize_tags params[:exercise][:tag_ids]
    end

    # Create new exercise after tags have been sanitized
    @exercise = Exercise.new exercise_params

    if @exercise.save
      redirect_to exercises_path, flash: { success: 'Exercise saved!' }
    else
      render :new
    end
  end

  def show
    @exercise = Exercise.find params[:id]
  end

  def edit
    @exercise = Exercise.find params[:id]
  end

  def update
    # Sanitize tags first
    if params[:exercise][:tag_ids]
      params[:exercise][:tag_ids] = sanitize_tags params[:exercise][:tag_ids]
    end

    # Create new exercise after tags have been sanitized
    @exercise = Exercise.find params[:id]

    if @exercise.update_attributes exercise_params
      redirect_to exercises_path, flash: { success: 'Exercise Updated!' }
    else
      render :edit
    end
  end

  def destroy
    @exercise = Exercise.find params[:id]

    if @exercise.destroy
      redirect_to exercises_path, flash: { success: 'Exercise Deleted!' }
    else
      redirect_to exercises_path
    end
  end

  private

  def exercise_params
    params.require(:exercise).permit(
      :content,
      tag_ids: []
    )
  end
end
