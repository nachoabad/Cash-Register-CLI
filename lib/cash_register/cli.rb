require 'readline'
require_relative 'order'
require_relative 'order/printer'

module CashRegister
  class CLI
    PROMPT = "Introduce a product code to add it to your order: "

    def self.run  
      while input = Readline.readline(PROMPT, true)
        break if input == "exit"

        order ||= Order.new

        order.add_line_item(input.upcase)

        Order::Printer.print(order)
      end
    end
  end
end

