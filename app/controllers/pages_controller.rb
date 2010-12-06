class PagesController < ApplicationController
  def home
    @title = "Home"
    @user = User.new
    if signed_in?
      redirect_to portfolios_path
    end
  end

  def help
    @title = "Help"
  end
end
