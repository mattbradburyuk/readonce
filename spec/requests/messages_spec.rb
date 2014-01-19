require 'spec_helper'

describe "Messages" do
  describe "POST /messages" do
    #replaced its with pending to stop the tests - were deleted but kept code for reference
    #before is a set up method
    before do
      #sign in with factory girl :user - didn;t get working
      sign_in create(:user)      
      #post is a test method that sends a get request to the url
      # message_path is a rails helper
      post messages_path, message: {body: 'Test'} 
    end
    #it is a test method which runs the actual test, describe describes the test (nested) (later replaced by pending)
    pending do
      Message.first.body.should eq 'Test'
    end
    
    pending "redirects to /messages" do
      #response is an onject which represents the respons from the server
      response.status.should eq 302
      response.location.should eq messages_url
      #should only really use one .should per it block as won't execute second .should if first one fails
    end
  end 
  
  describe "creating a message", type: :feature do
    before do
      sign_up
    end
    
    it "redirects to the messages index" do      
      # these are capybara methods
      # new_message_url - message helper gives the full url for new messages
      # new_message_path - give the relative path
      # fill_in finds form field in message body (:message_body) with 'Test'
      # page represents the web page
      visit new_message_path
      fill_in :message_body, with: 'Test'
      click_button 'Send'
      page.should have_content 'Test'
    end
  
    #context is a different method in rspec - just like describe but doesn't take variable, is a light weight wrapper
    #describe to describe actions
    #conext to describe state
    context "without filling the body field" do
      it 'displays an error' do
        visit new_message_path
        click_button 'Send'
        page.should have_content "can't be blank"
      end
    end
  end
  
  
  # :feature is an acceptance test
  # :request is an integration test
  # :model or :controller or :view are unit tests
  
  describe "viewing a list of messages", type: :feature do
    before do
      #note overiding factory girl user on the fly
      another_user = create(:user, email: 'another@example.com')
      create(:message, sender: another_user, body: "I am not yours")
      sign_up
    end
    
    it "doesn't show other people's messages" do
      visit messages_path
      page.should_not have_content "I am not Yours"
    end
  end
  
  def sign_up
      #new_user_registration_path is a devise path to the sign up page
      visit new_user_registration_path
      #fills in sign up
      fill_in :user_email, with: 'me@example.com'
      fill_in :user_password, with: 'password'
      fill_in :user_password_confirmation, with: 'password'
      click_button 'Sign up'  
  
  end
  
end
