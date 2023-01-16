ActiveAdmin.register Pnr do
  permit_params :flight_id

  controller do
    def scoped_collection
      Pnr.includes(:aeroplane_class, flight: :aeroplane)
    end
  end
end
