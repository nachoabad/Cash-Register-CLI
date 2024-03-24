require_relative 'discount'
require_relative 'discount/rule'
require_relative 'discount/action'

module CashRegister
  module Config
    PRODUCTS = {
      "GR1" => { name: 'Green Tea',     price: 3.11 },
      "SR1" => { name: 'Strawberries',  price: 5.00 },
      "CF1" => { name: 'Coffee',        price: 11.23 }
    }

    DISCOUNTS = [
      # "2x1 Green Tea" discount
      Discount.new(
        rule:   Discount::ProductQuantityGreaterRule.new(quantity: 1, product_code: "GR1"),
        action: Discount::TwoForOneDiscountAction.new),
      
      # "3 or more strawberries price 4.50€" discount
      Discount.new(
        rule:   Discount::ProductQuantityGreaterRule.new(quantity: 2, product_code: "SR1"),
        action: Discount::NewPriceDiscountAction.new(new_price: 4.50)),
    
      # "3 or more coffee price 2/3 of original" discount
      Discount.new(
        rule:   Discount::ProductQuantityGreaterRule.new(quantity: 2, product_code: "CF1"),
        action: Discount::FractionPriceDiscountAction.new(fraction: 2.fdiv(3)))
    ]
  end
end
