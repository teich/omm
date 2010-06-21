class SentMessagesController < ApplicationController
  def new
    @message = Message.find(params[:message])

    @message.create_users!
    @message.send!
    
    # Just send somewhere for now
    redirect_to '/messages'
  end
end
