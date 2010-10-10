task :cron => :environment do
  if Rails.env == "development"
    StockYank.new.sort_data_and_save 
  else
    time = Time.now
    if time.wday == 0 || time.wday == 6
      StockYank.new.sort_data_and_save
      UserMailer.deliver_stock_update
    end
  end
end
