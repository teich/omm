class Message < ActiveRecord::Base
  has_many :sent_messages, :dependent => :destroy
  has_many :users, :through => :sent_messages
  
  # Step through each of the users on the model, and send them this message
  def send!
    self.to_csv.split(/\n/).each do |line|
      user = User.find_by_email(line.split(/\t/)[0])
      fields = line.split(/\t/)[1..0]
      UserMailer.single_email(user, fields, self.template).deliver
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
end
