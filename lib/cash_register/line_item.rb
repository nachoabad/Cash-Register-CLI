require_relative 'config'
require_relative 'line_item/total_calculator'

class LineItem
  attr_reader :product_code, :quantity

  def initialize(product_code, quantity = 1)
    @product_code = product_code
    @quantity = quantity
  end

  def increment_quantity
    @quantity += 1
  end

  def original_price
    CashRegister::Config::PRODUCTS[product_code][:price]
  end

  def total
    TotalCalculator.call(self)
  end
end
