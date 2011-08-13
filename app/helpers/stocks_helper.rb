module StocksHelper
  def init_quotes
    update_quotes if should_refresh?
    catch_no_quotes
  end

  def update_quotes
    clear_quotes
    session[:quotes] = StockYank.get_all_stocks
    quotes[:expires_at] = 5.minutes.from_now
    quotes[:updated_at] = Time.now
  end

  def quotes
    session[:quotes]
  end

  def quotes_updated_at
    quotes[:updated_at]
  end

  private

    def clear_quotes
      session[:quotes] = {}
    end

    def catch_no_quotes
      unless quotes
        raise "No quotes in database"
      end
    end

    def should_refresh?
      !quotes.nil? && quotes[:expires_at] < Time.now
    end
end
