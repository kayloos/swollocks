class PagesController < ApplicationController
  def front
    @title = "It's almost a palindrome!"
    @user = User.new
    if user_signed_in?
      redirect_to portfolios_path
    else
      render :layout => false
    end
  end

  def help
    @title = "Help"
  end
end
