task :cron => :environment do
  if Time.now.hour == 18
    sort_data_and_save
  end
end
