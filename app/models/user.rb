class User < ActiveRecord::Base
  has_many :sent_messages, :dependent => :destroy
  has_many :messages, :through => :sent_messages
end
