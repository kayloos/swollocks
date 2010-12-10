class TradesController < ApplicationController
  before_filter :authenticate
  def index
    @trades = current_user.trades.paginate(:page => params[:page], :per_page => 30, :order => "created_at DESC")
  end
end
