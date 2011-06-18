class ApplicationController < ActionController::Base
  
  protect_from_forgery

  before_filter :authorize


  
  private

    def current_cart 
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
    end
   
    def increment_session_counter
      session[:counter] ||= 0
      session[:counter] += 1
    end

    def reset_session_counter
      if not session[:counter].nil?
        session[:counter] = 0
      end
    end
    
    def reset_current_cart
      session[:cart_id] = nil unless session[:cart_id].nil?
    end


  protected
    def authorize
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => 'Please log in'
      end
    end  
    
end
