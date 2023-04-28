require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }

    it { should validate_presence_of(:email) }
    it { should validate_uniqueness_of(:email).case_insensitive }
    it { should validate_presence_of(:password) }
    it { should validate_length_of(:password).is_at_least(Devise.password_length.first) }

    it 'should be valid with a valid email and password' do
      user = build(:user, email: 'test@example.com', password: 'password123')
      expect(user).to be_valid
    end

    it 'should not be valid with an invalid email' do
      user = build(:user, email: 'invalid_email')
      expect(user).not_to be_valid
    end

    it 'should not be valid with a short password' do
      user = build(:user, password: '123')
      expect(user).not_to be_valid
    end
  end

  describe 'associations' do
    # Add tests for associations here when you have them
  end

  describe 'devise modules' do
    it 'should include the correct modules' do
      expect(User.devise_modules).to include(:database_authenticatable, :registerable, :recoverable, :rememberable, :validatable)
    end
  end
end
