class MessagesController < ApplicationController
  
  #devise method that check the user 
  # also gives access to current_user method is all methods
  before_action :authenticate_user!
  
  #respond with html to requests
  respond_to :html
  #respond_to respond_with replaces the respond_to block in each method
  
  #note redirect clears the state as it is a new request therefore can't pass variables eg from create to new when create fails
  # render is not a new request so keeps the variables
  def index
    
  end
  
  
  
  def new
    
  end
  
  def create
    
    # message_params is a method below 
    # sets up the message with the sender association filled in
    @message = current_user.messages.create(message_params)
    respond_with message, location: messages_url
  
    #note if create fails rerenders the new form
    
    
    # root_url - contains full url, don;t use root_path as this is relative to root
    # redirect_to messages_url
  end
  
  private
  
  def message_params
    params[:message].permit :body
  end
  
  
  def message
    @message ||= Message.new
  end
  
  #Exposing to view as a method
  helper_method :message
  
  def messages
    @messages ||= current_user.messages
  
    #consider that there are usually users, hence when showing collections should be for current_user 
    #instead of messages.find params[:id] use current_user.messages.find params[:id]
  end
  helper_method :messages
  
  def receivers
    @receivers ||= User.all
  end
  helper_method :receivers
end
