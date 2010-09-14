class StocksController < ApplicationController
  before_filter :signed_in
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
      redirect_to :action => 'new', :controller => 'lists'
    else
      @title = "Tilføj aktie"
      render 'new'
    end
  end

  def destroy
    if Stock.destroy(params[:id])
      flash[:success] = "Aktie smidt ud"
      redirect_to :controller => 'lists', :action => 'new'
    else
      flash[:error] = "Aktien blev ikke smidt ud"
      redirect_to :controller => 'lists', :action => 'new'
    end
  end
end
