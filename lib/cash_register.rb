require 'pry'
class CashRegister

attr_accessor :total, :discount, :items, :last_void

def initialize (discount = nil)
 @total = 0.0
 @discount = discount
 @items = []
 @last_void = 0.0
 @last_qty = 0
end

def add_item (title, price, quanity = 1)
@total += price*quanity
@last_qty = quanity
quanity.times do
  @items << title
end
@last_void = price
end

def apply_discount
  percentage = @discount.to_f/100
  discount_amount = @total*percentage
  @total = @total - discount_amount
  if @discount
  "After the discount, the total comes to $#{@total.to_i}."
else
  "There is no discount to apply."
end
end

def items
  @items
end

def void_last_transaction
  @last_qty.times do
    @items.pop
  end

  if @items.empty?
    @total = 0.0
  else
    @total = @total - @last_void
  end
end

end
