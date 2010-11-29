class PortfoliosController < ApplicationController
  before_filter :signed_in
  def new
    @portfolio = Portfolio.new(params[:id])
    @portfolios = current_user.portfolios.order("created_at ASC")
    @stock = Stock.new
    @title = "Portfolios"
  end

  def create
    params[:portfolio][:current_amount] = params[:portfolio][:start_amount]
    @portfolio = Portfolio.new(params[:portfolio])
    @portfolio.user_id = current_user.id
    if @portfolio.save
      flash[:success] = "You've added the portfolio #{@portfolio.name}"
      redirect_to :action => 'new'
    else
      render 'new'
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    @stock_yanks = StockYank.all
    @quotes = StockYank.get_all_stocks
  end

  def destroy
    if Portfolio.destroy(params[:id]) && Stock.delete_all(["portfolio_id = ?", params[:id]])
      flash[:success] = "Portfolio destroyed"
      redirect_to :action => 'new'
    else
      flash[:error] = "There was an error, an the portfolio wasn't destroyed"
      redirect_to :action => 'new'
    end
  end

  def toggle_mail
    Portfolio.find(params[:portfolio_id]).toggle!(:deliver_mail)
    redirect_to :controller => 'portfolios', :action => 'new'
  end

end
