class CreateRides < ActiveRecord::Migration
  def change
    create_table :rides do |t|
      t.string :name
      t.text :description
      t.string :map
      t.float :distance
      t.date :date
      t.time :time
      t.float :avg_rating

      t.timestamps
    end
  end
end
