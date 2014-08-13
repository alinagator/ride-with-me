class AddRideRefToRatings < ActiveRecord::Migration
  def change
    add_reference :ratings, :ride, index: true
  end
end
