class CreatePnrs < ActiveRecord::Migration[7.0]
  def change
    create_table :pnrs do |t|
      t.references :flight, null: false, foreign_key: true
      t.references :aeroplane_class, null: false, foreign_key: true
      t.string :pnr, null: false

      t.timestamps

      t.index [:flight_id, :pnr], unique: true
    end
  end
end
