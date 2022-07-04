require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    category = Category.create(name:"Extra Shrubs")
    subject {
    described_class.new(
      name: "Smart",
      price: 34.99,
      quantity: 2,
      category_id: category.id )
  }

    it "checks product is valid" do 
      expect(subject).to be_valid
    end

    it "checks the name" do
      # product = Product.new(name: nil)
      expect(subject).to be_valid
    end

    it "checks the price" do
      # product = Product.new(price: nil)
      expect(subject).to be_valid
    end

    it "checks the quantity" do
      # product = Product.new(quantity: nil)
      expect(subject).to be_valid
    end
    
    it "checks the category" do
      # product = Product.new(category: nil)
      expect(subject).to be_valid
    end

  end
end
