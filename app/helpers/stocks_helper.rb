module StocksHelper
  def init_quotes
    session[:quotes] ||= StockYank.get_all_stocks   
    session[:quotes][:expires_at] ||= 2.minutes.from_now
  end

  def update_quotes
    session[:quotes] = StockYank.get_all_stocks
    session[:quotes][:expires_at] = 2.minutes.from_now
  end

  def quotes
    session[:quotes]
  end
end
