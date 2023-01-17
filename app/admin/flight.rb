ActiveAdmin.register Flight do
  permit_params :at, :origin, :destination, :aeroplane_id

  show do
    attributes_table do
      row :aeroplane
      row :origin
      row :destination
      row :at
      row :created_at
      row :updated_at
    end

    panel("PNRs") do
      table_for resource.pnrs.includes(:aeroplane_class, :reservation).order("aeroplane_class_id") do
        column :aeroplane_class
        column :pnr
        column :is_reserved do |pnr|
          pnr.reservation.present?
        end
        column :reserved_for do |pnr|
          link_to pnr.reservation.user_id, admin_user_path(pnr.reservation.user_id) if pnr.reservation.present?
        end
        column :reservation
      end
    end
  end

  controller do
    def scoped_collection
      Flight.includes(:aeroplane, :pnrs)
    end
  end
end
