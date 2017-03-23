require 'rails_helper'
describe MessagesController do
  let(:message) { create(:message, group_id: group.id, user_id: user.id) }
  let(:group) { create(:group) }
  let(:messages) { create_list(:message, 5, group_id: group.id)}
  let(:user) { create(:user) }

  before do
    get :index, group_id: group.id
    login_user user
  end

  describe 'GET #index' do

    it "populates an array of messages" do
      expect(assigns(:messages)).to eq messages
    end

    it "populates an array of group" do
      expect(assigns(:group)).to eq group
    end


    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'post #create' do
    it "redirect to the :index template" do
      expect(response).to render_template :index
    end
  end

end
