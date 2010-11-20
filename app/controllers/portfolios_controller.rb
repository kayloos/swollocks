class PortfoliosController < ApplicationController
  before_filter :signed_in
  helper_method :sort_column, :sort_direction
  def new
    @portfolio = Portfolio.new(params[:id])
    @portfolios = current_user.portfolios.order("created_at ASC")
    @stock = Stock.new
    @title = "Portfolioer"
  end

  def create
    @portfolio = Portfolio.new(params[:portfolio])
    @portfolio.user_id = current_user.id
    if @portfolio.save
      flash[:success] = "Du har tilføjet portfolioen #{@portfolio.name}"
      redirect_to :action => 'new'
    else
      render 'new'
    end
  end

  def edit
    @portfolio = Portfolio.find(params[:id])
    @stock_yanks = StockYank.search(params[:search]).order(sort_column + " " + sort_direction).paginate :page => params[:page], :per_page => 20 
    @quotes = Stock.get_stock
  end

  def destroy
    if Portfolio.destroy(params[:id]) && Stock.delete_all(["portfolio_id = ?", params[:id]])
      flash[:success] = "Portfolioen er blevet smidt ud"
      redirect_to :action => 'new'
    else
      flash[:error] = "Portfolioen blev ikke smidt ud"
      redirect_to :action => 'new'
    end
  end

  def toggle_mail
    Portfolio.find(params[:portfolio_id]).toggle!(:deliver_mail)
    redirect_to :controller => 'portfolios', :action => 'new'
  end

  private
    def sort_column
      StockYank.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
    
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
