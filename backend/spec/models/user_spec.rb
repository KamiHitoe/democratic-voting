require 'rails_helper'

RSpec.describe(User, type: :model) do
  describe 'test User' do
    it 'valid user object' do
      user = create(:user)
      expect(user).to(be_valid)
    end
  end
end
