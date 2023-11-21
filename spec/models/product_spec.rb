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



  end


end
