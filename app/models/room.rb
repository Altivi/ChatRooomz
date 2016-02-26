class Room < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :room
	belongs_to :user
end
