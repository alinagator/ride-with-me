class CreateRidesUsersTable < ActiveRecord::Migration
  def self.up
    create_table :rides_users, :id => false do |t|
        t.references :ride
        t.references :user
    end
    add_index :rides_users, [:ride_id, :user_id]
    add_index :rides_users, :user_id
  end

  def self.down
    drop_table :rides_users
  end
end