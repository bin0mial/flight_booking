ActiveAdmin.register AeroplaneClassSeat do
  permit_params :aeroplane_id, :aeroplane_class_id, :row_seats, :row_numbers, :price


  controller do
    def scoped_collection
      AeroplaneClassSeat.includes(:aeroplane, :aeroplane_class)
    end
  end
end
