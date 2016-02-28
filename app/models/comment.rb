class Comment < ActiveRecord::Base
	belongs_to :room
	belongs_to :user

	validates :content,    presence: true
end
