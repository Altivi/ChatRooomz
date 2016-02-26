class Room < ActiveRecord::Base
	has_many :comments, dependent: :destroy
	belongs_to :room
	belongs_to :user

	validates :title,     presence: true, 
					     length: { maximum: 20 }
end
