class SessionsController < ApplicationController
  def index
    @name = session[:name]
  end

  def set_session
    session[:name] = "frank"
  end

  def another
    @name = session[:name]
  end
end
