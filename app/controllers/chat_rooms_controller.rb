class ChatRoomsController < ApplicationController

	def new
		@chat_room = ChatRoom.new
	end

	def index
		@chat_rooms = ChatRoom.all	
	end

	def create
		@chat_room = current_user.chat_rooms.build(chat_rooms_params)
		if @chat_room.save!
			flash[:success] = 'Chat room added'
			redirect_to chat_rooms_path
		else
			render 'new'
		end
	end

	def show
		@chat_room = ChatRoom.includes(:messages).find_by(id: params[:id])	
		@message = Message.new
	end

	def chat_rooms_params
		params.require(:chat_room).permit(:title)	
	end
end
