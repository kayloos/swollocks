class StockYanksController < ApplicationController
  before_filter :authenticate_user!

  def index
    @title = "Stocks!"
    @stock_yanks = StockYank.all
    @stock_yank = StockYank.new
  end
  
  def show
    @title = "Stock information"
    @stock_yank = StockYank.find(params[:id])
    @stock = StockYank.get_stocks(@stock_yank.symbol)[@stock_yank.symbol]

    if params[:end] && params[:start]
      start = params[:start]
      the_end = params[:end]
      start_date = Date.new(start[:year].to_i, start[:month].to_i, start[:day].to_i)
      end_date = Date.new(the_end[:year].to_i, the_end[:month].to_i, the_end[:day].to_i)
    else
      start_date = Date.today - 31
      end_date = Date.today - 1
    end

    begin
      @days = StockYank.get_history(@stock_yank.symbol, start_date, end_date)
    rescue
      flash[:error] = "We could not retrieve history data for the stock you requested."
      redirect_to root_path
      return
    end
    @chart = make_chart(@days)
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
      Stock.destroy_all("stock_yank_id = #{params[:id]}")
      update_quotes
      redirect_to stock_yanks_path
    else
      flash[:error] = "Stock wasn't destroyed"
      redirect_to stock_yanks_path
    end
  end

  private

    def make_chart(days)
      days = days.reverse
      data = Hash.new
      data[:dates]  = Array.new
      data[:lows]   = Array.new
      data[:highs]  = Array.new
      data[:closes] = Array.new
      modulo_value = days.count / 4
      days.each_with_index do |d, index|
        data[:dates]  << (index.modulo(modulo_value) == 0 ? d[0] : '')
        data[:lows]   << d[3].to_f
        data[:highs]  << d[2].to_f
        data[:closes] << d[4].to_f
      end
      data[:max] = data[:highs].max.to_f
      data[:min] = data[:lows].min
      data
    end
end
