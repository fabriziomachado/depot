class ApplicationController < ActionController::Base
  protect_from_forgery
  
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

    
end
