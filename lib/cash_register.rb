class CashRegister
  attr_accessor :discount, :total, :items, :last_item

  def initialize(discount = nil)
    self.total = 0
    self.discount = discount
    self.items = []
  end

  def add_item(item, price, quantity=1)
    amount = price * quantity
    quantity.times { items << item }
    self.last_item = amount
    self.total += amount
  end

  def apply_discount
    unless !discount
      self.total -= (self.total * (self.discount / 100.0)).to_i
      "After the discount, the total comes to $#{total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    self.total -= self.last_item
  end
end
