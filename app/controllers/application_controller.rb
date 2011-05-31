class ApplicationController < ActionController::Base
  protect_from_forgery

  #rescue_from ActiveRecord::RecordNotFound, :with => :render_404
  rescue_from ActiveRecord::RecordNotFound do
    #render '/404.html', :layout => false, :status => :not_found
     logger.error "Attempt to access invalid cart #{params[:id]}"
     redirect_to store_url, :notice => 'Invalid Cart'
  end
  
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
