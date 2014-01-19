# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  #defines the factory - use the model name makes it easier otherwise need to tell it the class too
  factory :user do
    email "me@example.com"
    password "password"
    password_confirmation "password"
    
    #note password and password_confirmation must match and be at least 8 characters
  end
end
