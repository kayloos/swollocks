require 'spec_helper'

describe "Layout links" do

  site_title = "Breaking my balls"

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => site_title + " - Home")
  end

  it "should have a sign up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => site_title + " - Sign up")
  end

  it "should have an sign in page at '/signin'" do
    get '/signin'
    response.should have_selector('title', :content => site_title + " - Sign in")
  end
  
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => site_title + " - Help")
  end

  describe "when not signed in" do
    it "should have a signin link" do
      visit root_path
      response.should have_selector("a", :href => signin_path)
    end
  end

  describe "when signed in" do

    before(:each) do
      @user = Factory(:user)
      visit signin_path
      fill_in :email,    :with => @user.email
      fill_in :password, :with => @user.password
      click_button
    end

    it "should have a signout link" do
      visit root_path
      response.should have_selector("a", :href => signout_path)
    end

    it "should have a profile link" 
  end  
end
