require 'spec_helper'

describe User do

  before(:each) do
    @attr = { :name                  => "Claus Skou Nielsen", 
              :email                 => "kalusnoob@gmail.com",
              :password              => "foobar",
              :password_confirmation => "foobar"
    }
  end

  it "should now create a new instance given valid attributes" do
    User.create!(@attr)
  end

  it "should require a name" do
    no_name_user = User.new(@attr.merge( :name => "" ))
    no_name_user.should_not be_valid
  end

  it "should require an email address" do
    no_email_user = User.new(@attr.merge( :email => "" ))
    no_email_user.should_not be_valid
  end

  it "should accept a valid email address" do
    addresses = %w[kalusndsijo@gmail.com KALUSpikmund@gmail.com LOL@LOL.jp] 
    addresses.each do |address|
      valid_email_user = User.new(@attr.merge( :email => address ))
      valid_email_user.should be_valid
    end
  end

  it "should reject an invalid email address" do
    addresses = %w[user@foo,com bandit,@woo.com wopper@dibs,ok]
    addresses.each do |address|
      invalid_email_user = User.new(@attr.merge( :email => address ) )
      invalid_email_user.should_not be_valid
    end
  end

  it "should reject names that are too long" do
    long_name_user = User.new(@attr.merge( :name => ("a" * 51)) )
    long_name_user.should_not be_valid
  end

  it "should reject duplicate emails" do
    User.create!(@attr)
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  it "should reject emails identical up to case" do
    upcased_email = @attr[:email].upcase
    User.create!(@attr.merge( :email => upcased_email ) )
    user_with_duplicate_email = User.new(@attr)
    user_with_duplicate_email.should_not be_valid
  end

  describe "password validations" do
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).
        should_not be_valid
    end

    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "kagemand")).
        should_not be_valid
    end

    it "should reject short passwords" do
      User.new(@attr.merge(:password => "l", :password_confirmation => "l")).
        should_not be_valid
    end

    it "should reject long passwords" do
      User.new(@attr.merge(:password => ("l" * 41), :password_confirmation => ("l" * 41))).
        should_not be_valid
    end
  end

  describe "password encryption" do

    before(:each) do
      @user = User.create!(@attr)
    end

    it "should have an encrypted password" do
      @user.should respond_to(:encrypted_password)
    end

    it "should set the encrypted password" do
      @user.encrypted_password.should_not be_blank
    end

    describe "has_password? method" do

      it "should be true if the passwords match" do
        @user.has_password?(@attr[:password]).should be_true
      end

      it "should be false if the passwords dont match" do
        @user.has_password?("invalid").should be_false
      end

    end

    describe "authenticate method" do

      it "should return nil on email/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:email], "wrongpass")
        wrong_password_user.should be_nil
      end

      it "should return nil for an email address with no user" do
        nonexistent_user = User.authenticate("bar@foo.com", @attr[:password])
        nonexistent_user.should be_nil
      end

      it "should return the user on email/password match" do
        matching_user = User.authenticate(@attr[:email], @attr[:password])
        matching_user.should == @user
      end
      
    end
  end
end
