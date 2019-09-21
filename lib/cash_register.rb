class CashRegister
  attr_accessor :total, :discount, :items
  
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end 
  
  def add_item(item, price, quantity = 1)
    @previous_total = @total 
    quantity.times { @items << item  }
    @total += (price*quantity) 
  end 
  
  def apply_discount
    @total = @total - (@total*(@discount.to_f/100)).to_i
    if @total == 0 
      return "There is no discount to apply."
    else 
      return "After the discount, the total comes to $#{@total}."
    end 
  end 
  
  def void_last_transaction
    @total = @previous_total
  end 
  
end 