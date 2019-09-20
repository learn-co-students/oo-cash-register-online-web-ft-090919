require "pry"
class CashRegister
  attr_accessor :total, :discount, :cart, :transaction
  
  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @cart = []
  end
  
  def add_item(item, price, quantity = 1)
    @transaction = @total
    @total += (price * quantity)
    quantity.times do
      @cart << item
    end
  end
  
  def apply_discount
    if @discount != nil
      @total = @total - (@total * (@discount.to_f / 100.to_f))
      "After the discount, the total comes to $#{total.to_i}."
    else
       "There is no discount to apply."
     end
  end
  
  def items
    @cart
  end
  
  def void_last_transaction
    @total -= @total - @transaction
  end
end

