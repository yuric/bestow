class DevelopmentMailInterceptor
  def self.delivering_email(message)
    message.subject = "#{message.to}: #{APPNAME} #{message.subject}"
    #message.to = "#{message.to}, coxaqui@hotmail.com"
    message.bcc = "coxaqui@gmail.com"
  end
end