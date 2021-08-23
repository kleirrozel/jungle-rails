require 'rails_helper'
# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should only save the product when the name, price, quantity, and category fields have been filled out' do
      @category = Category.new(name: 'Pet Supplies')
      @product = Product.new(name: 'Carrot Chew Toy', price: 45.00, quantity: 12, category: @category)

      expect(@product).to be_valid
    end

    it 'should not save when the name field is left empty or blank' do
      @category = Category.new(name: 'Pet Supplies')
      @product = Product.new(name: nil, price: 45.00, quantity: 12, category: @category)

      expect(@product.errors[:name]).to be_empty
    end

    it 'should not save when the price field is left empty or blank' do
      @category = Category.new(name: 'Pet Supplies')
      @product = Product.new(name: 'Carrot Chew Toy', price: nil, quantity: 12, category: @category)

      expect(@product.errors[:price]).to be_empty
    end

    it 'should not save when the quantity field is left empty or blank' do
      @category = Category.new(name: 'Pet Supplies')
      @product = Product.new(name: 'Carrot Chew Toy', price: 45.00, quantity: nil, category: @category)
      
      expect(@product.errors[:quantity]).to be_empty
    end

    it 'should not save when the quantity field is left empty or blank' do
      @category = nil
      @product = Product.new(name: 'Carrot Chew Toy', price: 45.00, quantity: nil, category: @category)
      
      expect(@product.errors[:category]).to be_empty
    end
  end
end