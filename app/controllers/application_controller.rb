class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  before_filter :ensure_authenticated
  
  
  def ensure_authenticated
    unless env['warden'].authenticate!
      throw(:warden)
    end
  end

  def user
    env['warden'].user
  end
  


end