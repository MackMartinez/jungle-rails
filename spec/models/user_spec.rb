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

    it 'should not create a user if no e-mail is entered' do
      @user = User.new({name: nil, email: 'jack@testmail.com', password: '123', password_confirmation: '123'})
      expect(@user).not_to be_valid
    end
  end
end
