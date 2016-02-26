class RoomsController < ApplicationController
  
  before_action :find_room, only: [:show, :destroy]

  def index
  	@room = Room.new
  	@rooms = Room.all
  end

  def show
    @comments = @room.comments
    @new_comment = Comment.new(room: @room)
    respond_to do |format|
      format.html
      format.json { render :json => @comments.to_json(include: :user) }
      format.js
    end
  end

  def create
  	@room = current_user.rooms.new(room_params)
  	if @room.save
    	flash[:success] = "Room created!"
    	redirect_to root_url
    end
  end

  def destroy
	@room.destroy
	redirect_to root_url
  end

  private

  	def find_room
  		@room = Room.find(params[:id])
  	end

  	def room_params
  		params.require(:room).permit(:title)
  	end
end
