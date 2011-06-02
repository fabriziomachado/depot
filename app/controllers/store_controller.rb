class StoreController < ApplicationController
  def index
    @count_access_store_index = increment_session_counter
    @products = Product.all
    @cart = current_cart
  end

end
