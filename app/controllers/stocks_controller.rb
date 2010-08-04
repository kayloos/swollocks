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
      redirect_to :action => 'new', :list_id => @stock.list_id
    else
      @title = "Tilføj aktie"
      render 'new'
    end
  end

  def destroy
    list_id = Stock.find(params[:id]).list_id
    if Stock.destroy(params[:id])
      flash[:success] = "Aktie smidt ud"
      redirect_to :action => 'new', :list_id => list_id
    else
      flash[:error] = "Aktien blev ikke smidt ud"
      redirect_to :action => 'new', :list_id => list_id
    end
  end
end
