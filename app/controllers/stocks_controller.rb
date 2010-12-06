class StocksController < ApplicationController
  before_filter :signed_in
  def show
    @title = "Stocks!"
  end

  def buy
    @title = "Buy stock"
    @stock = Stock.new(params[:stock])
    @portfolio = Portfolio.find(@stock.portfolio_id)
    respond_to do |format|
      format.js { render :layout => false }
    end
  end

  def sell
    @title = "Sell stock"
    @stock = Stock.find(params[:id])
    @stock_amount = @stock.amount
    @stock.amount = 0
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

      if @portfolio.stocks.include?(@old_stock = Stock.find_by_stock_yank_id_and_portfolio_id(@stock.stock_yank_id, @portfolio.id))
        @old_stock.update_attributes(:amount => @old_stock.amount + amount,
                                     :traded_at => calculate_price(@old_stock.traded_at, traded_at,
                                                                   @old_stock.amount, amount))
        trade_stock_id = @old_stock.id
      else
        @stock.save
        trade_stock_id = @stock.id
      end
      flash.now[:success] = "Stock bought"
      @portfolio.current_amount -= value 
      @portfolio.save
      create_trade(trade_stock_id, "buy", traded_at, amount)
    else
      flash.now[:error] = "You don't have enough money to make the purchase"
    end

    respond_to do |format|
      format.html { redirect_to edit_portfolio_path(@portfolio.id) }
      format.js {
        render :trade_respond, :with => @trade
      }
    end
  end

  def sell_trade
    @old_stock = Stock.find(params[:id])
    stock = params[:stock]
    stock_amount = stock[:amount].to_f
    value = stock_amount * stock[:traded_at].to_f
    @portfolio = Portfolio.find(stock[:portfolio_id])

    unless stock_amount > @old_stock.amount
      if @old_stock.amount.to_f == stock_amount
        @old_stock.destroy
      else
        @old_stock.update_attributes(:amount => @old_stock.amount - stock_amount)
      end
      @portfolio.current_amount += value
      flash.now[:success] = "Stocks sold"
    else
      flash.now[:error] = "You can't sell more stocks than you have"
    end
    @portfolio.save

    create_trade(params[:id], "sell", stock[:traded_at], stock[:amount])
    trade_respond
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

  private
    
    def calculate_price(old_price, new_price, old_amount, new_amount)
      total = old_amount + new_amount.to_f
      ratio = old_amount / total
      rev_ratio = new_amount / total
      ( ( old_price * ratio ) + ( new_price * rev_ratio ) ).round(2)
    end

    def trade_respond
      respond_to do |format|
        format.html { redirect_to edit_portfolio_path(@portfolio.id) }
        format.js { 
          render :trade_respond
          @stock = "HEJ"
        }
      end
    end

    def create_trade(stock_id, action, traded_at, amount)
      @trade = Trade.create!(:stock_id => stock_id, :action => action, :traded_at => traded_at, :amount => amount)
    end
end
