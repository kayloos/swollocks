task :cron => :environment do
  if Rails.env == "development"
    StockYank.new.sort_data_and_save
  else
    time = Time.now
    StockYank.new.sort_data_and_save unless time.wday == 0 || time.wday == 6
  end
end
