class ApplicationController < ActionController::Base
  protect_from_forgery
  layout 'application'
  
  before_filter :ensure_authenticated
  
  
  def ensure_authenticated
    if RAILS_ENV == "production"
      unless env['warden'].authenticate!
        throw(:warden)
      end
    end
  end
  

  def user
    env['warden'].user
  end
  


end