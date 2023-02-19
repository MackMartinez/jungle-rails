require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it "should save a product with all four fields set" do
      @category = Category.create(name: 'Shrubs')
      @category.save

      @product = Product.new
      @product.name = 'Evergreen'
      @product.price = 80
      @product.quantity = 10
      @product.category_id = @category.id
      @product.save

      expect(@product).to be_valid
    end
    it "should not save a product without a name" do
      @category = Category.create(name: 'Shrubs')
      @category.save

      @product = Product.new
      @product.name = nil
      @product.price = 80
      @product.quantity = 10
      @product.category_id = @category.id
      @product.save

      expect(@product.errors.full_messages).to include("Name can't be blank")
    end
    it "should not save a product without a price" do
      @category = Category.create(name: 'Shrubs')
      @category.save

      @product = Product.new
      @product.name = 'Evergreen'
      @product.quantity = 10
      @product.category_id = @category.id
      @product.save

      expect(@product.errors.full_messages).to include("Price can't be blank")
    end
    it "should not save a product without a quantity" do
      @category = Category.create(name: 'Shrubs')
      @category.save

      @product = Product.new
      @product.name = 'Evergreen'
      @product.price = 80
      @product.quantity = nil
      @product.category_id = @category.id
      @product.save

      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end
    it "should not save a product without an id" do
      @category = Category.create(name: 'Shrubs')
      @category.save

      @product = Product.new
      @product.name = 'Evergreen'
      @product.price = 80
      @product.quantity = 10
      @product.category_id = nil
      @product.save

      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
