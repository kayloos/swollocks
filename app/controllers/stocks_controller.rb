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
      respond_to do |format|
        format.html { 
          flash[:success] = "Aktie tilføjet!"
          redirect_to edit_portfolio_path(params[:stock][:portfolio_id]) }
        format.js { render :nothing => true }
      end
    else
      flash[:error] = "Aktie blev ikke tilføjet"
      @title = "Tilføj aktie"
    end
  end

  def destroy
    if Stock.destroy(Stock.find_by_portfolio_id_and_stock_yank_id(params[:id], params[:stock_yank_id]).id)
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
