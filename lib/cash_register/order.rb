require_relative 'line_item'

class Order
  attr_reader :line_items

  def initialize()
    @line_items = []
  end

  def add_line_item(product_code)
    item = @line_items.find { |item| item.product_code == product_code }
    
    item ? item.increment_quantity : @line_items << LineItem.new(product_code)
  end

  def total
    line_items.sum(&:total)
  end
end
