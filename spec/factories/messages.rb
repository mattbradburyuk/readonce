FactoryGirl.define do
  factory :message do
    body "my message"
    #build_stubbed() creates a mock object ie doesn;t create something on the database which could interfer with other tests
    receiver {build_stubbed(:user)}
  end
end
