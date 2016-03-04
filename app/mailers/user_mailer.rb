class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  # config.action_mailer.default_url_options = { :host => "localhost:3000" }


  def welcome_email(user)
    @user = user
    @url  = 'http://localhost:3000'
    mail(to: @user.email, subject: 'Welcome to Netflix Reviews')
  end
end
