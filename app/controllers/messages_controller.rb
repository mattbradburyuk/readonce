class MessagesController < ApplicationController
  def create
    
    # message_params is a method below 
    Message.create message_params
    
    # root_url - contains full url, don;t use root_path as this is relative to root
    redirect_to root_url
  end
  
  private
  
  def message_params
    params[:message].permit :body
  end
  
end
