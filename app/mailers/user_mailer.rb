class UserMailer < ActionMailer::Base
  default :from => "Børsboss Aktiemail <notifications@boersboss.dk>"
  helper ApplicationHelper

  def stock_update
    users = User.all
    users.each do |user|
      portfolio = user.portfolios.where(:deliver_mail => true)
      unless portfolio.empty?
        recipients    user.email
        subject       "Aktieopdatering"
        sent_on       Time.now
# This code creates a hash, where the hash key becomes the portfolio name, and the value
# becomes an array of stocks and the data linked to each stock
        @stock_data = Hash.new

        portfolio.each do |p|
          @stock_data[l.name] = Array.new
          @stock = Stock.find_all_by_portfolio_id(p.id)
          @stock.each do |s|
            @stock_data[l.name] << StockYank.find(s.stock_id).attributes
          end
        end

        body          :name => user.name, :stock_data => @stock_data
      end
    end
  end

end
