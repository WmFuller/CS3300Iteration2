require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  context 'validations' do
    it 'is valid with a valid email' do
      expect(user).to be_valid
    end

    it 'is invalid with a blank email' do
      user.email = ''
      expect(user).to_not be_valid
    end

    it 'is invalid with an improperly formatted email' do
      user.email = 'invalid_email'
      expect(user).to_not be_valid
    end
  end
end
