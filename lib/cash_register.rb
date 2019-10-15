class CashRegister

  attr_accessor :total, :discount, :last_trans_amnt, :items

  def initialize(discount = 0)
    @total = 0
    @discount = discount
    @items = []
    @last_trans_amnt = 0
  end


  def add_item(title,price,quantity = 1)
    if quantity>1
      i=0
      while i<quantity #loop through items
        @items << title
        i+=1
      end
    else
      @items << title
    end
    @total += price*quantity
    @last_trans_amnt = price*quantity
    @total
  end

  def apply_discount()
    if @discount > 0
      @discount = @discount/100.to_f
      @total = @total - (@total * (@discount))
      "After the discount, the total comes to $#{@total.to_i}."
    else
      "There is no discount to apply."
    end
  end


  def void_last_transaction()
    @total = @total - @last_trans_amnt
  end

end

