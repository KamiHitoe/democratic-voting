require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'test Like' do

    it 'valid like object' do
      like = create(:like)
      expect(like).to(be_valid)
    end

  end
end
