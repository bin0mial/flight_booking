class CreateAeroplaneClassSeats < ActiveRecord::Migration[7.0]
  def change
    create_table :aeroplane_class_seats do |t|
      t.references :aeroplane, null: false, foreign_key: true
      t.references :aeroplane_class, null: false, foreign_key: true
      t.integer :row_seats, null: false
      t.integer :row_numbers, null: false
      t.float :price, null: false

      t.index [:aeroplane_id, :aeroplane_class_id],
              unique: true, name: "index_aeroplane_class_seats_on_aeroplane_and_aeroplane_class"

      t.timestamps
    end
  end
end
