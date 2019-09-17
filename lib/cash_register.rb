class CashRegister

  attr_accessor :total, :discount, :previous_total, :items, :previous_items
  
  def initialize(discount=nil)
    @total = 0.0
    @discount = discount
    @items = []
  end
  
  def add_item(item, price, quantity=1)
    @previous_total = @total
    @previous_items = @items
    @total += (price * quantity)
    quantity.times do
      @items << item
    end
    @total
  end
  
  def apply_discount
    if discount  
      @total = @total.to_f - ((@discount.to_f / 100.to_f) * total.to_f)
      "After the discount, the total comes to $#{total.to_i}."
    else
      "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @total = @previous_total
    @items = @previous_items
  end

end
