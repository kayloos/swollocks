task :cron => :environment do
  if Rails.env == "development"
    StockYank.new.sort_data_and_save 
  else
    time = Time.now
    #unless time.wday == 0 || time.wday == 6
      StockYank.new.sort_data_and_save
   # end
  end
end
