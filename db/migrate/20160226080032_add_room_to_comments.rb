class AddRoomToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :room, index: true, foreign_key: true
  end
end
