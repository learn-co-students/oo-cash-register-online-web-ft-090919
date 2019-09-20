class CashRegister
  attr_accessor :cash_register, :total, :discount, :items, :transactions
  
  def initialize(discount = 0)
    @items = []
    @transactions = {}
    @total = 0
    @discount = discount
  end
  
  def add_item(title, price, quantity = 1)
    @total += price * quantity
    
    (1..quantity).each{ |i| @items << title }
    
    @transactions[title] = {
      :quantity => quantity,
      :price => price
    }
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
    last_item = @items.last
    last_transaction = @transactions[last_item]
    cost = last_transaction[:quantity] * last_transaction[:price]
    @items = @items.reject { |item| item == last_item }
    @total -= cost
  end
end
