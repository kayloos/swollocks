class ApplicationController < ActionController::Base
  protect_from_forgery # See ActionController::RequestForgeryProtection for details
  include SessionsHelper
  include StocksHelper
  before_filter :meta_defaults

  def meta_defaults
    @meta_description = 'Analyze life on the stock market with Swollocks'
    @meta_keywords = 'stocks, stock, aktier, aktie, aktiespil, stock analysis'
  end
end
