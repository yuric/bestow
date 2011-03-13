class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :simple_alerts_creation
  rescue_from CanCan::AccessDenied, :with => :deny_access
  def deny_access
    flash[:error] = "This is not the page you are looking for. Move along."
    #say here something like: UserX canndo perform this acction
    
    if !user_signed_in?
		    flash[:error] = "Guests cannot perform this action"
	  end
    redirect_to root_url
  end
  
  def simple_alerts_creation
      @simplealert = Simplealert.new
  end
      
end
