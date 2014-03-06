require 'spec_helper'

describe Stock do
  describe "trading stock" do
    before(:each) do
      @user = Factory.create(:user)
      
      @quotes =
      {"aktie1"=>
        {:ask=>"10000.00",
         :bid=>"10000.00",
         :change=>"+600.00",
         :change_in_percent=>"+1.78%",
         :day_high=>"34460.00",
         :day_low=>"31680.00",
         :last_trade_price_only=>"10000.00",
         :name=>"aktieet",
         :symbol=>"aktie1",
         :volume=>"500"},
       "MAERSK-B.CO"=>
        {:ask=>"35920.00",
         :bid=>"35900.00", 
         :change=>"+580.00", 
         :change_in_percent=>"+1.64%", 
         :day_high=>"36080.00", 
         :day_low=>"33620.00", 
         :last_trade_price_only=>"35900.00", 
         :name=>"AP MOELLER-MAERS-", 
         :symbol=>"MAERSK-B.CO", 
         :volume=>"5445"},
       "ALK-B.CO"=>
        {:ask=>"334.50", 
         :bid=>"333.50", 
         :change=>"-0.50", 
         :change_in_percent=>"-0.15%", 
         :day_high=>"337.00", 
         :day_low=>"334.50", 
         :last_trade_price_only=>"334.50", 
         :name=>"ALK-ABELLO -B-", 
         :symbol=>"ALK-B.CO", 
         :volume=>"2239"}}

      @portfolio = @user.portfolios.create!(:name => "Portfolio 1",
                                            :start_amount => 500000,
                                            :current_amount => 500000)

      @stock_yank = StockYank.create!(:name => "maersk", :symbol => "aktie1")
      @stock = @portfolio.stocks.create!(:stock_yank_id => @stock_yank.id,
                                         :amount        => 50,
                                         :traded_at     => 1000.0)
    end

    describe "buying additional stock" do
      it "should take the money from the portfolio" do
        old_amount = @stock.portfolio.current_amount.to_f
        @stock.buy(@quotes, 5.0)
        @stock.portfolio.current_amount.to_f.should == old_amount - 5.0 * @stock.latest(@quotes).to_f
      end

      it "should calculate the correct price" do
        @stock.buy(@quotes, 50.0)
        @stock.traded_at.to_f.should == 5500.0
        @stock.amount.should == 100
      end

      it "should not accept buying more stock than you have money for" do
        lambda{@stock.buy(@quotes, 500.0)}.should raise_error
      end
    end

    describe "selling stock" do
      it "should sell correctly" do
        @stock.sell(@quotes, 25.0)
        @stock.amount.should == 25.0
      end

      it "should delete stock when all is sold" do
        stock_id = @stock.id
        old_count = Stock.all.count
        @stock.sell(@quotes, 50.0)
        Stock.all.count.should == old_count - 1
      end

      it "should not sell more stock than you have" do
        lambda{@stock.sell(@quotes, 500.0)}.should raise_error(Exception)
      end
    end
  end
end
