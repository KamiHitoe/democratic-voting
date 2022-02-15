require 'rails_helper'

RSpec.describe(User, type: :request) do
  describe 'test User request' do
    before(:each) do
      @users = create_list(:user, 10)
    end

    it 'get the user by uid' do
      # uidに合致したUserを取得できることを確認
      get "/v1/users?uid=#{@users[0][:uid]}"
      json = JSON.parse(response.body)
      expect(response.status).to eq(200)
      expect(json["uid"]).to eq(@users[0][:uid])
      expect(json).to be_kind_of(Hash)
    end

    it 'create a new user' do
      # Userが作成できることを確認
      expect do
        post('/v1/users', params: {
               uid: 'xxx',
               sex: 'male',
               age: 30,
             })
      end.to change(User, :count).by(1)
      json = JSON.parse(response.body)
      expect(response).to be_successful
    end


  end
end
