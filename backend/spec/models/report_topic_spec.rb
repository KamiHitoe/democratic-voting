require 'rails_helper'

RSpec.describe(ReportTopic, type: :model) do
  describe 'test ReportTopic' do
    it 'valid report_topic object' do
      report_topic = create(:report_topic)
      expect(report_topic).to(be_valid)
    end
  end
end
