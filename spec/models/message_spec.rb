require 'rails_helper'
describe Message do
  describe '#create' do
    it "is invalid without body" do
      message = build(:message, body: "")
      expect(message).not_to be_valid
    end

    it "is valid with body" do
      message = build(:message)
      expect(message).to be_valid
    end
  end
end
