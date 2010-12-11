class PortfoliosController < ApplicationController
  before_filter :authenticate
  before_filter :init_quotes
  before_filter :catch_no_quotes

  def index
    @user = current_user
    @title = "Portfolios"
    @portfolio = Portfolio.new(params[:id])
    @stock = Stock.new
    @portfolios = @user.portfolios.order("created_at ASC")
    unless quotes
      render :nothing => true, :text => "Ingen aktier i databasen"
    end
  end

  def new
  end

  def create
    params[:portfolio][:current_amount] = params[:portfolio][:start_amount]
    @portfolio = Portfolio.new(params[:portfolio])
    @portfolio.user_id = current_user.id
    if @portfolio.save
      flash[:success] = "You've added the portfolio #{@portfolio.name}"
    else
      flash[:error] = "Portfolio wasn't added"
    end
    redirect_to portfolios_path
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    @stock_yanks = StockYank.all
  end

  def destroy
    if Portfolio.destroy(params[:id]) && Stock.delete_all(["portfolio_id = ?", params[:id]])
      flash[:success] = "Portfolio destroyed"
    else
      flash[:error] = "There was an error, and the portfolio wasn't destroyed"
    end
    redirect_to portfolios_path
  end

  def refresh
    session.destroy
    redirect_back_or root_path
  end

  def toggle_mail
    Portfolio.find(params[:portfolio_id]).toggle!(:deliver_mail)
    redirect_to :controller => 'portfolios', :action => 'new'
  end
end
