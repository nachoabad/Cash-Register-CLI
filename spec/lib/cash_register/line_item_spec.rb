require './lib/cash_register/line_item'

RSpec.describe LineItem do
  before do
    stub_const("CashRegister::Config::PRODUCTS", {
      'GR1' => { price: 10.0 },
      'SR1' => { price: 20.0 }
    })
  end

  describe '#initialize' do
    it 'correctly assigns product_code and quantity' do
      line_item = LineItem.new('GR1', 2)

      expect(line_item.product_code).to eq('GR1')
      expect(line_item.quantity).to eq(2)
    end

    it 'assigns a default quantity of 1 if none is provided' do
      line_item = LineItem.new('GR1')

      expect(line_item.quantity).to eq(1)
    end
  end

  describe '#increment_quantity' do
    it 'increments the quantity of the line item by 1' do
      line_item = LineItem.new('GR1', 2)
      line_item.increment_quantity

      expect(line_item.quantity).to eq(3)
    end
  end

  describe '#original_price' do
    it 'returns the price of the product from the config' do
      line_item = LineItem.new('GR1')

      expect(line_item.original_price).to eq(10.0)
    end
  end

  describe '#total' do
    it 'calculates the total price based on quantity and original price' do
      line_item = LineItem.new('GR1', 3)

      expect(line_item.total).to eq(30.0)
    end
  end
end
