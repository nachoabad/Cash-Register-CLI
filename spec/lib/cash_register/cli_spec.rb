require 'readline'
require './lib/cash_register/cli'

RSpec.describe CashRegister::CLI do
  describe ".run" do
    let(:order_instance) { instance_double("Order") }

    before do
      allow(Readline).to receive(:readline).and_return('gr1', 'exit')
      allow(Order).to receive(:new).and_return(order_instance)
      allow(order_instance).to receive(:add_line_item)
      allow(Order::Printer).to receive(:print)
    end

    it "reads input until 'exit' is entered" do
      described_class.run

      expect(Readline).to have_received(:readline).with(CashRegister::CLI::PROMPT, true).twice
    end

    it "adds input as a line item to an order" do
      described_class.run

      expect(order_instance).to have_received(:add_line_item).with('gr1'.upcase)
    end

    it "prints the order after each input" do
      described_class.run

      expect(Order::Printer).to have_received(:print).with(order_instance).once
    end
  end
end
