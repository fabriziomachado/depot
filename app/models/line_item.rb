class LineItem < ActiveRecord::Base
  
  belongs_to :order
  belongs_to :product
  belongs_to :cart
    
  def total_price
    self.product.price * self.quantity
  end  
end
