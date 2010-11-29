class StocksController < ApplicationController
  before_filter :signed_in
  def show
    @title = "Stocks!"
  end

  def buy
    @title = "Buy stock"
    @stock = Stock.new(params[:stock])
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def sell
    @title = "Sell stock"
    @stock = Stock.find(params[:id])
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def buy_trade
    @stock = Stock.new(params[:stock])
    @portfolio = Portfolio.find(@stock.portfolio_id)
    amount = @stock.amount.to_f
    traded_at = @stock.traded_at.to_f
    value = amount * traded_at

    unless @portfolio.current_amount < value

      if @portfolio.stocks.include?(@old_stock = Stock.find_by_stock_yank_id(@stock.stock_yank_id))
        @old_stock.update_attributes(:amount => @old_stock.amount + amount)
      else
        @stock.save
      end
      @portfolio.current_amount -= value 
      @portfolio.save
    else
      flash[:error] = "You don't have enough money to make the purchase"
    end
    respond_to do |format|
      format.html { redirect_to edit_portfolio_path(@portfolio.id) }
      format.js { render :nothing => true }
    end
    
  end

  def sell_trade
    @old_stock = Stock.find(params[:id])
    stock = params[:stock]
    stock_amount = stock[:amount].to_f
    value = stock_amount * stock[:traded_at].to_f
    @portfolio = Portfolio.find(stock[:portfolio_id])

    if @old_stock.amount == stock[:amount]
      @old_stock.destroy
      @portfolio.current_amount += value
    elsif stock[:amount].to_f > @old_stock.amount
      flash[:error] = "You can't sell more stocks than you have"
    else
      @old_stock.update_attributes(:amount => @old_stock.amount - stock_amount)
      @portfolio.current_amount += value
    end
    @portfolio.save
    respond_to do |format|
      format.html { redirect_to edit_portfolio_path(@portfolio.id) }
      format.js   { render :nothing => true }
    end
  end

  def destroy
    if Stock.destroy_all(Stock.find_by_portfolio_id_and_stock_yank_id(params[:id], params[:stock_yank_id]).id)
      respond_to do |format|
        format.html { 
          flash[:success] = "Aktie smidt ud"
          redirect_to edit_portfolio_path(params[:id]) }
        format.js { render :nothing => true }
      end
    else
      flash[:error] = "Aktien blev ikke smidt ud"
      redirect_to :controller => 'portfolios', :action => 'new'
    end
  end
end
