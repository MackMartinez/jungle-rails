require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Validations' do
    it 'should not create a user if password and confirmation do not match' do
      @user = User.new({ name: 'Jack Sparrow', email: 'jack@testmail.com', password: '123', password_confirmation: '321'})
      expect(@user).not_to be_valid
    end

    it 'should create a user if password and confirmation to match' do
      @user = User.new({ name: 'Jack Sparrow', email: 'jack@testmail.com', password: '123', password_confirmation: '123'})
      expect(@user).to be_valid
    end

    it 'should not create a user if password is missing' do
      @user = User.new({ name: 'Jack Sparrow', email: 'jack@testmail.com', password: nil, password_confirmation: '123'})
      @user.save
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not create a user if password_confirmation is missing' do
      @user = User.new({ name: 'Jack Sparrow', email: 'jack@testmail.com', password: '123', password_confirmation: nil})
      @user.save
      expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
    end

    it 'should not create a user if email is missing' do
      @user = User.new({ name: 'Jack Sparrow', email: nil, password: '123', password_confirmation: '123'})
      @user.save
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'should not create a user if email is already taken' do
      @user1 = User.create({name: 'Jack Sparrow', email: 'jack@testmail.com', password: '123', password_confirmation: '123'})
      @user2 = User.create({name: 'Jack Sparrow', email: 'jack@testmail.com', password: '123', password_confirmation: '123'})
      expect(@user2).not_to be_valid
    end

    it 'should not create a user if password is less than 3 characters' do
      @user1 = User.create({name: 'Jack Sparrow', email: 'jack@testmail.com', password: '12', password_confirmation: '12'})
      expect(@user1).not_to be_valid
    end
  end
end
