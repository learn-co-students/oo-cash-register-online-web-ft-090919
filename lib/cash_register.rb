class CashRegister
  attr_accessor :total, :discount, :last_transaction
  attr_reader :items
  
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quantity = 1)
    @total += (price * quantity)
    quantity.times { @items << title }
    @last_transaction = [title, price, quantity]
  end
  
  def apply_discount
    if self.discount != 0
      @total = @total * ((100.0 - self.discount) / 100.0)
      return "After the discount, the total comes to $#{@total.to_i}."
    else
      return "There is no discount to apply."
    end
  end
  
  def items
    @items
  end
  
  def void_last_transaction
    @last_transaction[2].times { @items.pop }
    last_transaction_amount = @last_transaction[1] * @last_transaction[2]
    @total -= last_transaction_amount
  end
  
end