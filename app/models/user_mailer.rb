class UserMailer < ActionMailer::Base
	helper ApplicationHelper 
  def stock_update(user)
    recipients    user.email
    from          "Lisduck Stock Notifications <notifications@lisduck.dk>"
    subject       "Welcome to My Awesome Site"
    sent_on       Time.now
  	stock_data = Hash.new
  	list = List.find_all_by_user_id(user.id)
  	list.each do |l|
  		stock_data[l.name] = Array.new
  		stock = Stock.find_all_by_list_id(l.id)
  		stock.each do |s|
  			stock_data[l.name] << StockYank.find(s.stock_id).attributes
  		end
  	end
    body          :name => user.name, :stock_data => stock_data
  end

end