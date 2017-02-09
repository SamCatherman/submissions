class SessionsController < ApplicationController
  def new
    @user = User.new
  end

  def create
    input_username = params[:user][:username] #save username value submitted through form

    #if user exists, sign in
    if User.exists?(username: input_username)
      @user = User.find_by(username: input_username) #find user

      #if password is correct
      if @user.password == params[:user][:password]
        puts "Signed in"
        session[:user_id] = @user.id #set session user_id to that of user trying to log in
        redirect_to root_path #sends user back to home page
      else
        puts "Incorrect password"
        redirect_to new_session_path #sends user to sign-in form_for
      end
    #sends user back to sign-in form to try again
    else
      puts "This user doesn't exist"
      redirect_to new_session_path
    end
  end

  def destroy
    reset_session
    puts "Successfully signed out"
    redirect_to :root
  end
end
