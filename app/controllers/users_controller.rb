class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.name
    @stock = Stock.find_all_by_user_id(@user.id)
  end

  def new
    @title = "Sign up"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in(@user)
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      @title = "Sign up"
      @user.password = ""
      @user.password_confirmation = ""
      render 'new'
    end
  end

  def update

  end

  def destroy

  end

end
