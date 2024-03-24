class Discount
  class Rule
    def initialize(_options = {})
      @options = _options
    end

    def applicable?(discountable)
      raise NotImplementedError, "applicable? should be implemented in a sub-class of DiscountRule"
    end
  end

  class ProductQuantityGreaterRule < Rule
    def applicable?(discountable)
      discountable.quantity > @options[:quantity] &&
      discountable.product_code == @options[:product_code]
    end
  end
end
