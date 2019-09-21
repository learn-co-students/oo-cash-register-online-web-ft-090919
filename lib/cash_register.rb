class CashRegister
  attr_accessor :discount, :total, :items, :previous_total

  def initialize(discount = nil)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity = 1)
    @previous_total = @total
    @total += (price *quantity)
    quantity.times do
      @items << title
    end
  end

  def apply_discount
    if discount != nil
      @total = (@total *(1.to_f-(discount.to_f/100))).to_i
      "After the discount, the total comes to $#{@total}."
    else
      "There is no discount to apply."
    end
  end

  def void_last_transaction
    @total = @previous_total
  end 
end
