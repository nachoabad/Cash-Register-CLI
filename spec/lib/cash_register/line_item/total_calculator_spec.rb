require './lib/cash_register/line_item/total_calculator'

RSpec.describe LineItem::TotalCalculator do
  describe '.call' do
    let(:line_item) { instance_double("LineItem", original_price: 100, quantity: 2) }

    context 'when a discount is applicable' do
      let(:discount) { instance_double("Discount") }

      before do
        allow(CashRegister::Config::DISCOUNTS).to receive(:each).and_yield(discount)
        allow(discount).to receive(:applicable?).with(line_item).and_return(true)
        allow(discount).to receive(:compute_total).with(line_item).and_return(150)
      end

      it 'applies the discount and returns the discounted total' do
        expect(described_class.call(line_item)).to eq(150)
      end
    end

    context 'when no discounts are applicable' do
      before do
        no_applicable_discount = instance_double("Discount", applicable?: false)
        allow(CashRegister::Config::DISCOUNTS).to receive(:each).and_yield(no_applicable_discount)
      end

      it 'returns the original total price' do
        expect(described_class.call(line_item)).to eq(200)
      end
    end
  end
end
