class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include SessionsHelper

  add_flash_types :danger, :info, :warning, :success

  def authenticate_user
    if @current_user == nil
        flash[:notice] = t('notice.login_needed')
        redirect_to new_session_path
    end
  end

end
