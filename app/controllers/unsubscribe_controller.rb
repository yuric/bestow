class UnsubscribeController < ApplicationController
  def nomoreemailforyou

    # This method is disabled (has not significant corresponding view) for now

  end
    
  def cancelsubscription
    @alerts = Simplealert.find(:all, :conditions => "email = '#{params[:email]}'")
        @alerts.each do |alert|
          #puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n InMethod:=>#{@alert.email}\nsecrettoken:=>#{@alert.location_zip}\nsecrettoken:=>#{@alert.secrettoken} \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
          if (alert.secrettoken == params[:secrettoken])
            alert.update_attribute(:activealert, false)
            #alert.destroy
          end
        end
  end
  
  
  def resubscribe
    #this is going to be similar to subscribe. Add a link at the view
  end

end
#:conditions => "user_login = '#{user.username}'")
#@alert = Simplealert.find(:all, :conditions =>" secrettoken = '#{params[:secrettoken]}'")#