class CashRegister
  attr_accessor :total, :discount, :items, :previous_total
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end 
  
  def add_item(title, price, quantity = 1)
    @previous_total = @total
    @total += price * quantity
    quantity.times {@items << title}
  end 
  
  def apply_discount
    if @discount > 0
      @total = total * (1 - (discount.to_f/100))
       "After the discount, the total comes to $#{self.total.to_i}."
   else 
       "There is no discount to apply."
   end 
  end 
  
  def void_last_transaction
    
    @total = @previous_total
    
  end 
  
  
end 
