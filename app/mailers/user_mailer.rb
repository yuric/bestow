class UserMailer < ActionMailer::Base
  default :from => "yuri@yuriprime.com"

    def registration_confirmation(user)
      @user = user
      #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
      mail(:to => "#{user.name} <#{user.email}>", :subject => "Registered")
    end
    def Created_new_Alert(alert)
      @alert = alert
      #attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
      mail(:to => "<#{alert.email}>", :subject => "Alert Created")
    end
end
