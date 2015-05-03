class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  ###
  # Take a list of ids from a multiple select and determine if they
  # should be created or not. If the tag is new, create it and add
  # it to the list of tag ids
  ###
  def sanitize_tags(tag_ids)
    real_ids = []

    tag_ids.reject(&:blank?).each do |tag_id_or_name|
      tag = Tag.find_by(id: tag_id_or_name)
      tag = Tag.create(name: tag_id_or_name) if tag.nil?

      real_ids.push tag.id
    end

    real_ids
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def authorize
    return unless current_user.nil?
    redirect_to root_url, flash: { alert: 'You need to sign up to do that!' }
  end
end
