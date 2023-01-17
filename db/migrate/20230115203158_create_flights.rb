class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.string :origin, null: false
      t.string :destination, null: false
      t.datetime :at, null: false
      t.references :aeroplane, null: false, foreign_key: true

      t.timestamps
    end
  end
end
