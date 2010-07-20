class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end

  def new
    @title = "Sign up"
    @user = User.new
  end

  def update

  end

  def destroy

  end

  def sign_in
    @title = "Sign in"

    if params[:email] then
      email = params[:email]
      password = params[:password]
      if user = User.authenticate(email, password) then
        session[:user] = user
      else
        @title = "YOU FAIL"
      end
    end
  end

end
