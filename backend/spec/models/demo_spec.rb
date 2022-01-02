require 'rails_helper'

RSpec.describe Demo, type: :model do
  it "is valid with valid attributes" do
    expect(Demo.new).to be_valid
  end
  it "is not valid without a title" do
    demo = Demo.new(name: nil)
    expect(demo).to_not be_valid
  end
end
