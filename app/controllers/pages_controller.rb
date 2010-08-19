class PagesController < ApplicationController
  def home
    @title = "Home"
    if signed_in?
      redirect_to current_user
    end
  end

  def help
    @title = "Help"
  end

end
