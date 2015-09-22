class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
 # protect_from_forgery with: :exception
	@@uidList = ["1073719775978420","1177007412316322","731459686959084","932544443484230"]
          # => me dev,             me production,     會長 production,    jack produciton
  private
  def current_user
    @current_user ||= User.find_by(uid: session[:user_id]) if session[:user_id]
  end
  helper_method :current_user

  def is_authorized_user
  	
  	if current_user != nil
  		if @@uidList.include? current_user.uid
  			return true
  		end
  	end
  	return false
  end
  helper_method :is_authorized_user
  
end
