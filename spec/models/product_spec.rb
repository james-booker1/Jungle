require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    category = Category.create(name:"Extra Shrubs")

    it "checks product is valid" do 
      product = Product.new(
          name: "Smart",
          price_cents: 34.99,
          quantity: 2,
          category_id: category.id )
      
      expect(product).to be_valid
    end

    it "checks the name" do
      product = Product.new(
          name: nil,
          price_cents: 34.99,
          quantity: 2,
          category_id: category.id )
      
      expect(product).not_to be_valid
    end

    it "checks the price_cents" do
      product = Product.new(
          name: "Smart",
          price_cents: nil,
          quantity: 2,
          category_id: category.id )
      
      expect(product).not_to be_valid
    end

    it "checks the quantity" do
      product = Product.new(
          name: "Smart",
          price_cents: 34.99,
          quantity: nil,
          category_id: category.id )
      
      expect(product).not_to be_valid
    end
    
    it "checks the category" do
      product = Product.new(
          name: "Smart",
          price_cents: 34.99,
          quantity: 2,
          category_id: nil )
      
      expect(product).not_to be_valid
    end

  end
end
