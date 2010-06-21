class UserMailer < ActionMailer::Base
  default :from => "oren@heroku.com"
  
  def single_email(user, fields, message)
    @user = user
    @fields = fields
    @message = message
    mail(:to => "oren@heroku.com", #user.email,
         :subject => message.subject)
  end
end
