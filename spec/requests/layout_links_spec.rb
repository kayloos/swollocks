require 'spec_helper'

describe "LayoutLinks" do

  it "should have a Home page at '/'" do
    get '/'
    response.should have_selector('title', :content => "Børsboss - Home")
  end

  it "should have a sign up page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Børsboss - Sign up")
  end

  it "should have an sign in page at '/signin'" do
    get '/signin'
    response.should have_selector('title', :content => "Børsboss - Sign in")
  end
  
  it "should have a Help page at '/help'" do
    get '/help'
    response.should have_selector('title', :content => "Børsboss - Help")
  end
end
