class UsersController < ApplicationController
  #displays all users
  def index
    @users = User.all
  end
#initializes new user
  def new
    @user = User.new
  end
#saves new user, sets user to own session
  def create
    @user = User.create(user_params)
    session[:user_id] = @user.id
    redirect_to users_path(@user)
  end
#displays specific user by ID
  def show
    @user = User.find(params[:id])
  end
#finds user by ID, displays edit page if user matches
  def edit
    @user = User.find(params[:id])
    redirect_to root_url unless @current_user == @user
  end
#saves updated user information only if user is logged in
  def update
    @user = User.find(params[:id])
    redirect_to root_url unless @current_user == @user
    @user.update(user_params)
    redirect_to users_path(@user)
  end
#user params
  private
  def user_params
    params.require(:user).permit(:username, :password)
  end

end
