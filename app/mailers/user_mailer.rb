class UserMailer < ActionMailer::Base
  default :from => "oren@heroku.com", :bcc => "crm@heroku.com"
  
  def single_email(user, fields, message)
    @user = user
    @fields = fields
    @message = message
    mail(:to => user.email,
         :subject => message.subject)
  end
end
