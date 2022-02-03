require 'rails_helper'

RSpec.describe(Comment, type: :model) do
  describe 'test Comment' do
    before(:each) do
      @comment = create(:comment)
    end

    it 'valid comment object' do
      expect(@comment).to(be_valid)
    end

    it 'comment has default values' do
      expect(@comment.timestamp).to(be_truthy)
      expect(@comment.like_num).to(eq(0))
    end
  end
end
