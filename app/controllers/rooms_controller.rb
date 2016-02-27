class RoomsController < ApplicationController
  
  before_action :find_room, only: [:show, :destroy]
  before_action :logged_in_user, only: [:show, :create]

  def index
    @room = Room.new
  	@rooms = Room.includes(:user).order('created_at DESC')
  end

  def show
    @comments = @room.comments
    @room_owner = @room.user
    @new_comment = Comment.new(room: @room)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def new
    @room = Room.new
  end

  def create
  	@room = current_user.rooms.new(room_params)
  	respond_to do |format|
      if @room.save
      	flash.now[:success] = "Room created!"
      	format.html { redirect_to rooms_url }
        format.js
      else
        flash.now[:danger] = "Room doesn't created!"
        format.html { redirect_to rooms_url }
        format.js
      end
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy if current_user.id == @room.user_id
    respond_to do |format|
      format.html { 
        flash[:success] = "Room successfully deleted"
        redirect_to user_path(@room.user) 
      }
      format.js
    end
  end

  private

  	def find_room
  		@room = Room.find(params[:id])
  	end

  	def room_params
  		params.require(:room).permit(:title)
  	end
end
