class UsersController < ApplicationController
  before_filter :authenticate, :only => [:show, :edit, :update]
  before_filter :correct_user, :only => [:show, :edit, :update]
  before_filter :admin_user,   :only => [:index, :destroy]

  def index
    @title = "All users"
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @title = @user.name
    @lists = @user.lists.order("created_at ASC")
  end

  def new
    @title = "Sign up"
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Velkommen til børsboss"
      redirect_to @user
    else
      @title = "Sign up"
      @user.password = ""
      @user.password_confirmation = ""
      render 'new'
    end
  end

  def edit
    @title = "Edit user"
  end

  def update
    if @user.update_attributes(params[:user])
      flash[:success] = "Profil opdateret."
      redirect_to @user
    else
      @title = "Edit user"
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "Bruger slettet."
    redirect_to users_path
  end

  private

    def authenticate
      deny_access unless signed_in?
    end

    def correct_user
      @user = User.find(params[:id])
      unless current_user?(@user) || current_user.admin?
        redirect_to(root_path)
        flash[:error] = "Not allowed"
      end 
    end

    def admin_user
      redirect_to(root_path) unless current_user.admin?
    end
end
