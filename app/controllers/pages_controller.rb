class PagesController < ApplicationController
  def home
    @title = "Home"
  end

  def contact
    @title = "Contact"
  end

  def about
    @title = "About"
  end

  def help
    @title = "Help"
  end

  def yank_stock_data
    hej = StockYank.new.sort_data
    @output = hej
  end

end
