task :cron => :environment do
  if Rails.env == "development"
    StockYank.new.sort_data_and_save
  else
    if Time.now.hour == 18
      StockYank.new.sort_data_and_save
    end
  end
end
