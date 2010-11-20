class StockYanksController < ApplicationController
  before_filter :signed_in

  def index
    @title = "Stocks!"
    @stock_yanks = StockYank.all
    @stock_yank = StockYank.new
  end
  
  def show
  end

  def new
  end

  def create
    @stock_yank = StockYank.new(params[:stock_yank])
    if @stock_yank.save
      flash[:success] = "Aktie tilføjet!"
      redirect_to stock_yanks_path
    else
      @title = "Tilføj aktie"
      render 'new'
    end
  end

  def destroy
    if StockYank.destroy(params[:id])
      flash[:success] = "Aktie smidt ud"
      redirect_to stock_yanks_path
    else
      flash[:error] = "Aktien blev ikke smidt ud"
      redirect_to stock_yanks_path
    end
  end
end
