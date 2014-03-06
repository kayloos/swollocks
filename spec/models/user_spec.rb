require 'spec_helper'

describe User do
  before(:each) do
    @attr = { :name => "cnielsen", :email => "kooko@lol.com", :password => "password", :password_confirmation => "password" }
  end

  it "should create a new user" do
    User.create!(@attr)
  end
end
