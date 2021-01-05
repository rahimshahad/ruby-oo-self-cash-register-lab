class CashRegister
    attr_accessor :total, :discount, :items, :last_transaction
    def initialize(discount = nil, items=[])
        @total = 0
        @discount = discount
        @items = items
        @last_transaction = nil
        @last_item = nil

    end
    def add_item(title, price, amount = 1)
        i = 0
        while i < amount do
         @items << title
        @last_transaction = price * amount
        @last_item = title
        i += 1
        end
        self.total += price * amount
    end
    def apply_discount
        if @discount 
        self.total -= self.total * @discount/100.to_i
        "After the discount, the total comes to $#{self.total}."
        else
            "There is no discount to apply."
        end
    end
    def void_last_transaction
        @items.delete(@last_item)
        if @items.empty?
            self.total = 0.0
        else
            self.total -= @last_transaction
        end


    end

end
