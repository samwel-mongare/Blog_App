class ApplicationController < ActionController::Base

  add_flash_types :success, :danger, :info, :warning
  
  def current_user
    User.find(params[:user_id])
  end
end
