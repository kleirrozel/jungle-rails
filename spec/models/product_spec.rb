require 'rails_helper'
# validates :name, presence: true
# validates :price, presence: true
# validates :quantity, presence: true
# validates :category, presence: true

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    it 'should only save the product when the name, price, quantity, and category fields have been filled out' do
      @category = Category.create 
      @category.name = 'Pet Supplies'

      @product = Product.new
      @product.name = 'Chew Toy'
      @product.price = 45.00
      @product.quantity = 12
      @product.category = @category

      expect(@product).to be_valid

      # @product!save
      # expect(@product.id).to be_present
    end

    it 'should not save when the name field is left empty or blank' do
      @category = Category.create 
      @category.name = 'Pet Supplies'

      @product = Product.new
      @product.name = nil
      @product.price = 45.00
      @product.quantity = 12
      @product.category = @category
      
      expect(@product.errors[:name]).to be_empty
    end

    it 'should not save when the price field is left empty or blank' do
      @category = Category.create 
      @category.name = 'Pet Supplies'

      @product = Product.new
      @product.name = 'Chew Toy'
      @product.price = nil
      @product.quantity = 12
      @product.category = @category
      
      expect(@product.errors[:price]).to be_empty
    end

    it 'should not save when the quantity field is left empty or blank' do
      @category = Category.create 
      @category.name = 'Pet Supplies'

      @product = Product.new
      @product.name = 'Chew Toy'
      @product.price = 45.00
      @product.quantity = nil
      @product.category = @category
      
      expect(@product.errors[:quantity]).to be_empty
    end

    it 'should not save when the quantity field is left empty or blank' do
      @category = nil

      @product = Product.new
      @product.name = 'Chew Toy'
      @product.price = 45.00
      @product.quantity = 12
      @product.category = @category
      
      expect(@product.errors[:category]).to be_empty
    end
  end
end