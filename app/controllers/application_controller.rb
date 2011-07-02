class ApplicationController < ActionController::Base
  
  protect_from_forgery

  before_filter :authorize
  before_filter :set_i18n_locale_from_params


  
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
    
    
     def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{params[:locale]} translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { :locale => I18n.locale }
    end
    
end
