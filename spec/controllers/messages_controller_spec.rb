require 'rails_helper'
describe MessagesController do
  let(:message) { create(:message, group_id: group.id, user_id: user.id) }
  let(:group) { create(:group) }
  let(:messages) { create_list(:message, 5, group_id: group.id)}
  let(:user) { create(:user) }

  before do
    login_user user
  end

  describe 'GET #index' do
    before do
      get :index, group_id: group.id
    end

    it "populates an array of messages" do
      expect(assigns(:messages)).to eq messages
    end

    it "populates an array of group" do
      expect(assigns(:group)).to eq group
    end

    it "populates an array of message" do
      expect(assigns(:message)).to be_a_new(Message)

    end


    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'post #create' do


    it "can save message" do
      expect {
        post :create, params: { group_id: group.id, message: attributes_for(:message) }
      }.to change(Message, :count).by(1)
    end

    it "redirect to messages#index" do
      post :create, params: { group_id: group.id, message: attributes_for(:message)}
      expect(response).to redirect_to group_messages_path
    end

    it 'can not save message' do
      expect {
        post :create, params: { group_id: group.id, message: attributes_for(:message, body: "")}
      }.not_to change(Message, :count)
    end

    it 'redirects to messages#index' do
      post :create, params: { group_id: group.id, message: attributes_for(:message, body: "")}
      expect(response).to redirect_to group_messages_path
    end

    it "get flash message" do
      post :create, params: { group_id: group.id, message: attributes_for(:message, body: "")}
      expect(flash[:alert]).to include ("本文を入力してください。")
    end

  end


end


