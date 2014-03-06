# By using the symbol ':user', we get Factory Girl to simulate the User model.
FactoryGirl.define do
  sequence :email do |n|
    "test#{n}@example.com"
  end

  factory :user do
    name                  "Test User"
    email                 { Factory.next(:email) }
    password              "password"
    password_confirmation "password"
  end
end
