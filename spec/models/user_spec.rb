require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    # validation examples here
    it 'should only create a user profile when all the fields are filled out and the requirements are met' do
      @user = User.new(first_name: 'Elvis', last_name: 'Bun', email: 'elvisbun@mail.com', password: 'banana', password_confirmation: 'banana')
      
      expect(@user).to be_valid
    end

    it 'should not save user when first name field is left empty or blank' do
      @user = User.new
      @user.save

      expect(@user.errors.messages[:first_name]).not_to be_empty
    end

    it 'should not save user when last name field is left empty or blank' do
      @user = User.new
      @user.save

      expect(@user.errors.messages[:last_name]).not_to be_empty
    end

    it 'should not save user when email field is left empty or blank' do
      @user = User.new
      @user.save

      expect(@user.errors.messages[:email]).not_to be_empty
    end

    it 'should not save user when password field is left empty or blank' do
      @user = User.new
      @user.save

      expect(@user.errors.messages[:password]).not_to be_empty
    end

    it 'should not save user when password_confirmation field is left empty or blank' do
      @user = User.new
      @user.save

      expect(@user.errors.messages[:password_confirmation]).not_to be_empty
    end

  end

  describe '.authenticate_with_credentials' do
    # examples for this class method here
  
    it 'should return user if authentication is succesful' do
      @user = User.new(first_name: 'Elvis', last_name: 'Bun', email: 'elvisbun@mail.com', password: 'banana', password_confirmation: 'banana')
      @user.save
      loggedin_user = @user.authenticate_with_credentials('elvisbun@mail.com','banana')
      expect(loggedin_user.email).to eq(@user.email)
    end

    it 'should return nil if email is wrong' do
      @user = User.new(first_name: 'Elvis', last_name: 'Bun', email: 'elvisbun@mail.com', password: 'banana', password_confirmation: 'banana')
      @user.save
      loggedin_user = @user.authenticate_with_credentials('wrong@mail.com','banana')
      expect(loggedin_user).to eq(nil)
    end

    it 'should return nil if password is wrong' do
      @user = User.new(first_name: 'Elvis', last_name: 'Bun', email: 'elvisbun@mail.com', password: 'banana', password_confirmation: 'banana')
      @user.save
      loggedin_user = @user.authenticate_with_credentials('elvisbun@mail.com','0123944')
      expect(loggedin_user).to eq(nil)
    end
  end

end
