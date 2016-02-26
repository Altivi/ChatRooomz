module RoomsHelper

	def room_owner?(comment)
		@room.user == comment.user
	end
end
