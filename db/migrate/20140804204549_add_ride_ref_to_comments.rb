class AddRideRefToComments < ActiveRecord::Migration
  def change
    add_reference :comments, :ride, index: true
  end
end
