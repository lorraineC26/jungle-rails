require 'rails_helper'

RSpec.describe User, type: :model do

  describe 'Validations' do
    before(:each) do
      # a user with all valid fields
      @user = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@com',
        password: 'password123',
        password_confirmation:'password123'
      )
    end

    it "should be saved successfully with all fields valid" do
      expect(@user.save).to be true
    end

    it "should not be saved when password and password_confirmation fields are different" do
      @user.password_confirmation = '123'
      expect(@user.save).to be false
    end

    it "should not be saved when missing password fields" do
      @user.password = nil || @user.password_confirmation = nil
      expect(@user.save).to be false
    end

    

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  end

end
