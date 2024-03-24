require_relative '../config'

class LineItem
  class TotalCalculator
    def self.call(line_item)
      CashRegister::Config::DISCOUNTS.each do |discount|
        return discount.compute_total(line_item) if discount.applicable?(line_item)
      end

      line_item.original_price * line_item.quantity
    end
  end
end
