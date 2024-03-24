class Discount
  class Action
    def initialize(_options = {})
      @options = _options
    end

    def compute_total(discountable)
      raise NotImplementedError, "compute_total should be implemented in a sub-class of DiscountAction"
    end
  end

  class TwoForOneDiscountAction < Action
    def compute_total(discountable)
      discountable.original_price * discountable.quantity.fdiv(2).ceil
    end
  end

  class NewPriceDiscountAction < Action
    def compute_total(discountable)
      @options[:new_price] * discountable.quantity
    end
  end

  class FractionPriceDiscountAction < Action
    def compute_total(discountable)
      discountable.original_price * @options[:fraction] * discountable.quantity
    end
  end
end
