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
  end
end
