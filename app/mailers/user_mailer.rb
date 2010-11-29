class UserMailer < ActionMailer::Base
  default :from => "swollenstock.com"

  def notification(user)
    @user = user
    @url = "www.swollenstock.com"
    @portfolios = user.portfolios.where("deliver_mail = ?", true)
    @symbols = Array.new
    @stocks = Array.new
    @portfolios.each_with_index do |p, index|
      @symbols[index] = Array.new
      p.stocks.each do |s|
        sy = s.stock_yank
        @symbols[index] << sy.name
      end
      @stocks << StockYank.get_stocks(@symbols[index])
    end
    mail(:to => user.email,
         :subject => "Stock update")
  end
end
