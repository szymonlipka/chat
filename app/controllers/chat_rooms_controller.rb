class ChatRoomsController < ApplicationController
  def create
    @chat_room = ChatRoom.new(chat_room_params)
    if @chat_room.save
      render @chat_room
    else
      render @chat_room.errors, status: :unprocessable_entity
    end
  end

  def show
    @chat_room = ChatRoom.find(params[:id])
    render json: @chat_room
  end

  def index
    @chat_rooms = ChatRoom.all
    render json: @chat_rooms
  end

  private

  def chat_room_params
    params.require(:chat_room).permit(:name)
  end
end
