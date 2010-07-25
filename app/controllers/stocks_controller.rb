class StocksController < ApplicationController
  def show
    @title = "Stocks!"
  end

  def new
    @title = "Tilføj aktie"
    @stock = Stock.new
  end

  def create
    @stock = Stock.new(params[:stock])
    if @stock.save
      flash[:success] = "Aktie tilføjet!"
      redirect_to User.find(@stock.user_id)
    else
      @title = "Tilføj aktie"
      render 'new'
    end
  end

  def destroy
    if Stock.destroy(params[:id])
      flash[:success] = "Aktie smidt ud"
      redirect_to current_user
    else
      flash[:error] = "Aktien blev ikke smidt ud"
      redirect_to current_user
    end
  end

end
