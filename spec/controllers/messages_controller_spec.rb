require 'rails_helper'

describe MessagesController do
  let(:message) { create(:message, group_id: group.id, user_id: user.id) }
  let(:group) { create(:group) }
  let(:user) { create(:user) }
  let(:messages) { create_list(:message, 5, group_id: group.id)}

  describe 'GET #index' do
    it "populates an array of messages" do
      get :index, group_id: group.id
      expect(assigns(:messages)).to eq messages
      expect(assigns(:group)).to eq group
    end

    it "renders the :index template" do
      get :index, group_id: group
      expect(response).to render_template :index
    end
  end

  describe 'post #create' do
    it "create new message" do
      expect(message).to be_valid
    end

    it "can't createnew message" do
      message = build(:message, body: "")
      message.valid?
      expect(message.errors[:body]).to include("を入力してください。")
    end
  end

end
