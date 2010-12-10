class StockYanksController < ApplicationController
  before_filter :authenticate

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
      update_quotes
      flash[:success] = "Stock added!"
      redirect_to stock_yanks_path
    else
      @title = "Add stock"
      render 'new'
    end
  end

  def destroy
    if StockYank.destroy(params[:id])
      flash[:success] = "Stock destroyed"
      Stock.destroy_all.where("stock_yank_id = ?", params[:id])
      update_quotes
      redirect_to stock_yanks_path
    else
      flash[:error] = "Stock wasn't destroyed"
      redirect_to stock_yanks_path
    end
  end
end
