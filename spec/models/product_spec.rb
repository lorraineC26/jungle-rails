require 'rails_helper'

RSpec.describe Product, type: :model do

  describe "Validations" do

    before(:each) do
      @category = Category.new(name: "Test Plants")

      @product = Product.new(
        name: 'Sunflower',
        price: 19.99,
        quantity: 5,
        category: @category
      )
    end

    it "should save successfully with all four fields set" do
      expect(@product.save).to be true
    end

    it "should not save with the absence of name" do
      @product.name = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it "should not save with the absence of price" do
      # set the price_cents attribute to nil since Money gem often has an underlying attribute to store the cents value
      # set product.price to nil -> 0.00 
      @product.price_cents = nil
      expect(@product.price).to be_nil
      
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Price can't be blank") 
    end

    it "should not save with the absence of quantity" do
      @product.quantity = nil
      expect(@product.save).to be false
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end





  end


end
