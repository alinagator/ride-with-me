class AddUserRefToRides < ActiveRecord::Migration
  def change
    add_reference :rides, :user, index: true
  end
end
