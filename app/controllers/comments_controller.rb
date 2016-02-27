class CommentsController < ApplicationController

	def index
		@room = Room.find(params[:room_id])
		@comments = @room.comments.includes(:user).order('created_at ASC')
	end

	def create
		@room = Room.find(params[:room_id])
	    @comment = @room.comments.create(comment_params)
	    respond_to do |format|
			format.html { redirect_to room_url(@room) }
			format.js
		end
	end

	private

	def comment_params
		if current_user
			hash = params.require(:comment).permit(:content)
			hash[:user_id] = current_user.id
			return hash
		end
	end

end
