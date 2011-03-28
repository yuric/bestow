class UnsubscribeController < ApplicationController
  def nomoreemailforyou

    # This method is disabled (has not significant corresponding view) for now

  end
  
  
  
  def cancelsubscription
    puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n Unsubscribe:=>#{params[:email]}\nsecrettoken:=>#{params[:secrettoken]} \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
    
    if @alert = Simplealert.find_by_email(params[:email])
        @alert.each do |alert|
          puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n InMethod:=>#{@alert.email}\nsecrettoken:=>#{@alert.location_zip}\nsecrettoken:=>#{@alert.secrettoken} \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
          if (alert.secrettoken == params[:secrettoken])
            puts "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n IFIF Found it:\nsecrettoken:=>#{@alert.secrettoken} \n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n"
          end
        end
    end
    
  
  end
  
  
  
  
  def resubscribe
  end

end
#:conditions => "user_login = '#{user.username}'")
#@alert = Simplealert.find(:all, :conditions =>" secrettoken = '#{params[:secrettoken]}'")#