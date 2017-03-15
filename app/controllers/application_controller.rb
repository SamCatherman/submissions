class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  #sets session for current user
  before_action :authenticate_user! 
end
