class StoreController < ApplicationController
  
  skip_before_filter :authorize
  
  def index
    
    if params[:set_locale]
      redirect_to store_path(:locale => params[:set_locale])
    else    
      @count_access_store_index = increment_session_counter
      @products = Product.all
      @cart = current_cart
    end
  end

end
