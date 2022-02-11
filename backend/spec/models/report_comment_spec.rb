require 'rails_helper'

RSpec.describe ReportComment, type: :model do
  describe 'test ReportComment' do

    it 'test report_comment object' do
      report_comment = create(:report_comment)
      expect(report_comment).to(be_valid)
    end

  end
end
