class CashRegister
  attr_accessor :cash_register, :total, :discount, :items, :last_item_total
  
  def initialize(discount = 0)
    @items = []
    @total = 0
    @last_item_total = 0
    @discount = discount
  end
  
  def add_item(title, price, quantity = 1)
    @last_item_total = price * quantity 
    @total += @last_item_total

    quantity.times{ |i| @items << title }
  end
  
  def items
    @items
  end
  
  def apply_discount
    if @discount > 0
      @total =  @total - (@total * @discount / 100)
      "After the discount, the total comes to $#{total}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    @total -= @last_item_total
  end
end
