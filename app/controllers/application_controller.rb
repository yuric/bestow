class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :simple_alerts_creation
  rescue_from CanCan::AccessDenied, :with => :deny_access
  #routing no record found
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
  ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
    #Contributions from: This makes sure the errors are properly placed and that the textfield do not change style when with errors
    #https://rails.lighthouseapp.com/projects/8994/tickets/5803-actionviewbasefield_error_proc-ignores-label_tags-with-class-options
    #if html_tag =~ /<label/# user this one to have the errors just bellow instance.
    #  %|<div class="fieldWithErrors">#{html_tag}</div>|.html_safe
    if html_tag =~ /<label/ #use this bellow to include errors to the right of the attribute e.i. FIRST NAME is not valid
      %|<div class="fieldWithErrors">#{html_tag} <span class="error">#{[instance.error_message].join(', ')}</span></div>|.html_safe
    else
      html_tag
    end
  end
  
  def method_missing(id, *args)
      redirect_to 'errors/notfound404' 
  end
      
end
