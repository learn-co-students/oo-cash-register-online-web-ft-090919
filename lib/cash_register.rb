require "pry"

class CashRegister
  
  attr_accessor :total, :discount, :item, :price, :quantity
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @@items = []
  end
  
  def total
    @total
  end
  
  def add_item(item, price, quantity = 1)
    @price = price
    @quantity = quantity
    @total += (price * quantity)
    @@items += [item] * quantity
    @last_transaction = @total
  end
  
  def apply_discount
    if @discount != 0
      @total -= @discount * 10
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @@items
  end
  
  def void_last_transaction
    @total -= (@price * @quantity)
  end
end
