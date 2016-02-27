module RoomsHelper

	def room_owners_comment?(comment)
		@room.user == comment.user
	end
end
