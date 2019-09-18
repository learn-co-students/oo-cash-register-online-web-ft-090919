require "pry"


class CashRegister

  attr_accessor :total, :last_transaction
  attr_reader :discount, :items

  # track last item details added in case we need to void it
  @last_transaction=[]

  def initialize(discount = 0)
    @items = []
    @total = 0
    @discount = discount
  end

  def add_item(item, price, quantity = 1)
    (1..quantity).each {|qty| @items << item}
    @last_transaction = [item, price, quantity]
    @total += price * quantity
  end

  def apply_discount

    msg = ""

    if @discount == 0
      msg = "There is no discount to apply."
    else
      @total = @total - (@total * (@discount / 100.0))
      msg = "After the discount, the total comes to $#{@total.to_i}."
    end

    p msg
  end

  def void_last_transaction
    @total -= @last_transaction[1] * @last_transaction[2]
  end

end
