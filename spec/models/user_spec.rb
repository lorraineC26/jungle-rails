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

    it "should not be saved with absent first_name" do
      @user.first_name = nil
      expect(@user.save).to be false
    end

    it "should not be saved with absent last_name" do
      @user.last_name = nil
      expect(@user.save).to be false
    end

    it "should not be saved with absent email" do
      @user.email = nil
      expect(@user.save).to be false
    end

    it "should not be saved with absent password fields" do
      @user.password = nil || @user.password_confirmation = nil
      expect(@user.save).to be false
    end

    it "should not be saved when password and password_confirmation fields are different" do
      @user.password_confirmation = '123'
      expect(@user.save).to be false
    end

    it "should not be saved when email has been registered already (case insensitive)" do
      @user2 = User.new(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johnDOE@com',
        password: 'password123',
        password_confirmation: 'password123'
      )

      @user.save
        
      expect(@user2.save).to be false
    end

    it "should faile when password does not meet the minium length of 6 characters" do
      @user.password = '123' && @user.password_confirmation = '123'
      expect(@user.save).to be false
    end

  end

  describe '.authenticate_with_credentials' do

    before(:each) do
      # make a user existed with all valid fields
      @user = User.create(
        first_name: 'John',
        last_name: 'Doe',
        email: 'johndoe@com',
        password: 'password123',
        password_confirmation:'password123'
      )
    end

    it 'should authenticate with valid credentials' do
      test_user = User.authenticate_with_credentials('johndoe@com', 'password123')
      expect(test_user).to eq(@user)
    end

    it 'should return nil with absent email or password' do
      test_user = User.authenticate_with_credentials()
      expect(test_user).to be_nil
    end

    it 'should return nil with wrong email' do
      test_user = User.authenticate_with_credentials('john@com', 'password123')
      expect(test_user).to be_nil
    end

    it 'should return nil with wrong password' do
      test_user = User.authenticate_with_credentials('johndoe@com', 'incorrectpassword')
      expect(test_user).to be_nil
    end

    it 'should authenticate with email with leading/trailing whitespaces' do
      test_user = User.authenticate_with_credentials('     johndoe@com  ', 'password123')
      expect(test_user).to eq(@user)
    end

    it 'should authenticate with email in different cases' do
        test_user = User.authenticate_with_credentials('johnDOE@com', 'password123')
        expect(test_user).to eq(@user)
    end


  end

end
