class AddAeroplaneClassSeatToPnr < ActiveRecord::Migration[7.0]
  def change
    add_reference :pnrs, :aeroplane_class_seat, null: true, foreign_key: true

    Pnr.all.each do |pnr|
      pnr.aeroplane_class_seat_id =
        pnr.aeroplane_class.aeroplane_class_seats.find_by(aeroplane_id: pnr.flight.aeroplane_id).id
      pnr.save
    end

    change_column_null :pnrs, :aeroplane_class_seat_id, false
  end
end
