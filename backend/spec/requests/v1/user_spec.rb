require 'rails_helper'

RSpec.describe(User, type: :request) do
  describe 'test User request' do
    before(:each) do
      @user = create(:user)
    end

    it 'get the user by uid' do
      # uidに合致したユーザーを取得
      get "/v1/users?uid=#{@user[:uid]}"
      json = JSON.parse(response.body)
      expect(response.status).to(eq(200))
      expect(json["uid"]).to(eq(@user[:uid]))
    end

    it 'create a new user' do
      # ユーザが追加されることと、sex:がASCIIからUNICODEに変換されることを確認
      expect do
        post('/v1/users', params: {
               uid: 'xxx',
               sex: 'male',
               age: 30,
             })
      end.to(change(User, :count).by(1))
      json = JSON.parse(response.body)
      expect(json["sex"]).to(eq("男性"))
    end


  end
end
