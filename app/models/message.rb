class Message < ActiveRecord::Base
  has_many :sent_messages, :dependent => :destroy
  has_many :users, :through => :sent_messages
  
  # Step through each of the users on the model, and send them this message
  def send!
    self.to_csv.split(/\n/).each do |line|
      user = User.find_by_email(line.split(/\t/)[0])
      fields = line.strip.split(/\t/)[1..-1]
      self.send_message(user, fields)
    end
  end
  
  def create_users!
    self.to_csv.split(/\n/).each do |line|
      email = line.split(/\t/)[0]
      if (!User.find_by_email(email))
        User.create(:email => email)
      end
    end
  end
  
  def blast!
    self.create_users!
    self.send!
  end


  def send_message(user,fields)
    UserMailer.single_email(user, fields, self).deliver
    SentMessage.create(:user => user, :message => self)
  end

  handle_asynchronously :blast!  
  handle_asynchronously :send_message
end
