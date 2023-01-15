ActiveAdmin.register Aeroplane do
  permit_params :aeroplane_type

  show do
    attributes_table do
      row :aeroplane_type
      row :created_at
      row :updated_at
    end

    panel("Seat Classes") do
      table_for resource.aeroplane_class_seats do
        column :id do |seat|
          link_to seat.id, public_send("admin_#{seat.class.name.underscore}_path", seat)
        end
        column :aeroplane_class
        column :row_seats
        column :row_numbers
        column :price
      end
    end
  end

  controller do
    def scoped_collection
      Aeroplane.includes(:aeroplane_class_seats, :aeroplane_classes)
    end
  end
end
