require 'rails_helper'

RSpec.describe(Topic, type: :model) do
  describe 'test Topic' do
    before(:each) do
      @topic = create(:topic)
    end

    it 'valid topic object' do
      expect(@topic).to(be_valid)
    end

    it 'topic has default values' do
      expect(@topic.timestamp).to(be_truthy)
      expect(@topic.option_1_num).to(eq(0))
      expect(@topic.option_2_num).to(eq(0))
      expect(@topic.option_3_num).to(eq(0))
      expect(@topic.option_4_num).to(eq(0))
      expect(@topic.voted_num).to(eq(0))
    end
  end
end
