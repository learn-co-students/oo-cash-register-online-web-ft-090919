class CashRegister
  
  attr_accessor :total, :discount, :price, :item
  
  @@items = []
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
  end
  
  def total
    @total
  end
  
  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    @@items += [title] * quantity
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
end
