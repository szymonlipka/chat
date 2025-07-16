require 'rails_helper'

RSpec.describe "ChatRooms", type: :request do
  describe "post /create" do
    it "returns http success and creates a chat room" do
      expect do
        post "/chat_rooms", params: { chat_room: { name: "test" } }
      end.to change(ChatRoom, :count).by(1)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /show" do
    it "returns http success" do
      chat_room = FactoryBot.create(:chat_room)
      get "/chat_rooms/#{chat_room.id}"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /index" do
    it "returns http success" do
      get "/chat_rooms"
      expect(response).to have_http_status(:success)
    end
  end

end
