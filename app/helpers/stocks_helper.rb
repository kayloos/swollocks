module StocksHelper
  def init_quotes
    update_quotes if should_refresh?

    catch_no_quotes
  end

  def update_quotes
    clear_quotes
    session[:quotes] = StockYank.get_all_stocks
    session[:quotes][:expires_at] = 5.minutes.from_now
    session[:quotes][:updated_at] = Time.now
  end

  def quotes
    session[:quotes]
  end

  def quotes_updated_at
    session[:quotes][:updated_at]
  end

  private

    def clear_quotes
      session[:quotes] = nil
    end

    def catch_no_quotes
      unless quotes
        render :nothing => true, :text => "Ingen aktier i databasen"
      end
    end

    def should_refresh?
      !quotes.nil? && quotes[:expires_at] < Time.now
    end
end
