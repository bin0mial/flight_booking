class CreateAeroplanes < ActiveRecord::Migration[7.0]
  def change
    create_table :aeroplanes do |t|
      t.string :aeroplane_type, null: false, index: { unique: true }

      t.timestamps
    end
  end
end
