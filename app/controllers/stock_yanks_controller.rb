class StockYanksController < ApplicationController
  before_filter :authenticate

  def index
    @title = "Stocks!"
    @stock_yanks = StockYank.all
    @stock_yank = StockYank.new
  end
  
  def show
    @title = "Stock information"
    @stock_yank = StockYank.find(params[:id])

    if params
      the_end = params[:end]
      start = params[:start]
      start_date = Date.new(start[:year].to_i, start[:month].to_i, start[:day].to_i)
      end_date = Date.new(the_end[:year].to_i, the_end[:month].to_i, the_end[:day].to_i)
    else
      start_date = Date.today - 31
      end_date = Date.today - 1
    end

    @days = StockYank.get_history(@stock_yank.symbol, start_date, end_date)
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
