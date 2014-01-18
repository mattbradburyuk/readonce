require 'spec_helper'

describe "Messages" do
  describe "POST /messages" do
    
    #it is a test method which runs the actual test, describe describes the test (nested)
    it "creates a message" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
     
      #post is a test method that sends a get request to the url
      # message_path is a rails helper
      
      post messages_path, message: {body: 'Test'}
      
      Message.first.body.should eq 'Test'
      
      
    end
  end
end
