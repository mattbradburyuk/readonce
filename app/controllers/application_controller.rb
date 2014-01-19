class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 
  #checks anything thats not a get request
  protect_from_forgery with: :exception
end
