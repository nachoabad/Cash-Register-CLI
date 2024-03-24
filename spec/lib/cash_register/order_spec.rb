require './lib/cash_register/order'

RSpec.describe Order do
  describe '#add_line_item' do
    let(:order) { Order.new }
    let(:product_code) { 'GR1' }

    context 'when the product does not exist in the order' do
      it 'adds a new line item' do
        expect { order.add_line_item(product_code) }
          .to change { order.line_items.length }.from(0).to(1)
      end
    end

    context 'when the product already exists in the order' do
      before do
        order.add_line_item(product_code)
      end

      it 'increments the quantity of the existing line item' do
        existing_item = order.line_items.find { |item| item.product_code == product_code }
        initial_quantity = existing_item.quantity
        order.add_line_item(product_code)

        expect(existing_item.quantity).to eq(initial_quantity + 1)
      end
    end
  end

  describe '#total' do
    let(:order) { Order.new }
    let(:line_item_double1) { instance_double("LineItem", product_code: 'GR1', total: 3.11) }
    let(:line_item_double2) { instance_double("LineItem", product_code: 'SR1', total: 5.00) }

    before do
      allow(LineItem).to receive(:new).and_return(line_item_double1, line_item_double2)
      order.add_line_item('GR1')
      order.add_line_item('SR1')
    end

    it 'returns the sum of the totals of all line items' do
      expect(order.total).to eq(8.11)
    end
  end
end
