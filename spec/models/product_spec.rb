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




  end


end
