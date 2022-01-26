require 'rails_helper'

RSpec.describe Topic, type: :model do
  it 'create topic' do
    topic = create(:topic)
    expect(topic).to be_valid
    expect(topic.option_1_num).to eq(10)
  end
end
