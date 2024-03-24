require_relative '../order'

class Order
  class Printer
    CURRENCY = "€"

    def self.print(order)
      puts "Code | Qty"
      puts "-----------------"

      order.line_items.each { |item| puts "#{item.product_code}  |  #{item.quantity}" }

      puts "-----------------"
      puts "Order Total: #{order.total}#{CURRENCY}"
    end
  end
end
