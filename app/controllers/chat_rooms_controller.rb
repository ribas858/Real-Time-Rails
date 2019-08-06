class ChatRoomsController < ApplicationController
    def index
      @chat_rooms = ChatRoom.all
    end
  
    def new
      @chat_room = ChatRoom.new
      @chat_room.messages.build
      @chat_rooms = ChatRoom.all
    end
  
    def create
      @chat_room = current_user.chat_rooms.build(chat_room_params)
      
      if @chat_room.save
        flash[:success] = 'Chat room added!'
        redirect_to chat_rooms_path
      else
        render 'new'
      end
    end
  
    def show
      @chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])
      @message = Message.new
    end

    def create_message
      @chat_room = ChatRoom.find(params[:id])
      @message = Message.new(message_params)
     
      if @message.save!
        redirect_to chat_room_path(@chat_room)
      else
        redirect_to chat_room_path(@chat_room)
      end
    end
  
    private
  
    
    def message_params
      params.require(:message).permit([:body, :user_id, :chat_room_id])
    end
    
    def chat_room_params
      params.require(:chat_room).permit(:title, :user_to,
         messages_attributes: [:id, :body, :chat_room_id, :user_id])
    end
  end