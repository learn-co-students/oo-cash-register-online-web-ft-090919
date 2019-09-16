class CashRegister
  attr_accessor :total, :discount, :items, :last_trans
  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
  end
  
  def add_item(title, price, quanity = 1)
    self.last_trans = price * quanity
  
    self.total += (price * quanity)
    self.items.concat([title] * quanity)
  end
  
  def apply_discount
    unless self.discount == 0
      self.total = self.total - (self.total* (self.discount * 0.01)).to_i
      "After the discount, the total comes to $#{self.total}."
    else
      "There is no discount to apply."
    end
  end
  
  def void_last_transaction
    self.total -= self.last_trans
  end
end