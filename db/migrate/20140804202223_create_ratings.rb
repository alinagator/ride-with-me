class CreateRatings < ActiveRecord::Migration
  def change
    create_table :ratings do |t|
      t.float :rating

      t.timestamps
    end
  end
end
