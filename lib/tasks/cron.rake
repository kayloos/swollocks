task :cron => :environment do
  time = Time.now
  unless time.wday == 0 || time.wday == 6
    StockYank.new.sort_data_and_save
  end
end
