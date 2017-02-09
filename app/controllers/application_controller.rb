class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #sets session for current user
  before_action :set_current_user
#begins new session for logged-in user
  def set_current_user
    if User.exists?(session[:user_id])
      @current_user = User.find(session[:user_id])
    else
      @current_user = nil
    end
  end

end
