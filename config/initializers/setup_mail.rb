ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "yuriprime.com",
  :user_name            => "yuri@yuriprime.com",
  :password             => "9852612",
  :authentication       => "plain",
  :enable_starttls_auto => true
}

ActionMailer::Base.default_url_options[:host] = "doutdes.heroku.com"
ActionMailer::Base.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?
