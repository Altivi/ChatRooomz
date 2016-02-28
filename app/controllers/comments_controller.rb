class CommentsController < ApplicationController

	before_action :find_room, only: [:index, :create, :destroy]

	def index
		if current_user
	      	@comments = @room.comments.where.not("deleted = ? AND user_id = ?", true, current_user.id).includes(:user).order('created_at ASC')
	    else
	    	@comments = @room.comments.includes(:user).order('created_at ASC')
	    end
	end

	def create
	    @comment = @room.comments.new(comment_params.merge(user_id: current_user.id))
	    unless @comment.save
	    	flash.now[:danger] = "Room doesn't created!"
	    end
	    respond_to do |format|
			format.html { redirect_to room_url(@room) }
			format.js
		end
	end

	def destroy
		@post = Room.find(params[:room_id])
		@comment = @post.comments.find(params[:id])
		if @comment.user_id == current_user.id
			@comment.update_columns(deleted: true)
		end
		respond_to do |format|
			format.html { redirect_to room_url(@room) }
			format.js
		end
	end

	private

	def find_room
		@room = Room.find(params[:room_id])
	end

	def comment_params
		params.require(:comment).permit(:content)
	end

end
