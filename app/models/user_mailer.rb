class UserMailer < ActionMailer::Base

  def stock_update
    recipients    "kalusn@gmail.com"
    from          "Lisduck Stock Notifications <notifications@lisduck.dk>"
    subject       "Welcome to My Awesome Site"
    sent_on       Time.now
  end

end
