class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_notifications
  
  protected

  def mark_as_read
    @notifications.update_all(read_at: Time.zone.now)
  end
  helper_method :mark_as_read

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:surname,:address,:username,:phone])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name,:surname,:address,:username,:phone])
  end

  def set_notifications
    @notifications = Notification.where(recipient: current_user).unread
    @unrnotifications = Notification.where(recipient: current_user).where.not(read_at:nil).limit(10)
    @conversations = Conversation.where("sender_id = ? OR reciever_id = ?", current_user.id, current_user.id)
  end

end
