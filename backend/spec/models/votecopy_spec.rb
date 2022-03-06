require 'rails_helper'

RSpec.describe(Vote, type: :model) do
  describe 'test Vote' do
    it 'valid vote object' do
      vote = create(:vote)
      expect(vote).to(be_valid)
    end
  end
end
