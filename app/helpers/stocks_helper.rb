module StocksHelper
  class StockException < StandardError; end
  def init_quotes
    update_quotes if should_refresh?

    catch_no_quotes
  end

  def update_quotes
    session[:quotes] = StockYank.get_all_stocks
    session[:quotes][:expires_at] = 5.minutes.from_now
    session[:quotes][:updated_at] = Time.now
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
      unless quotes || quotes != nil
        raise StockException, "Unable to load quotes in to session hash"
      end
    end

    def should_refresh?
      (session[:quotes].nil? || session[:quotes] == {}) || session[:quotes][:expires_at] < Time.now
    end
end
