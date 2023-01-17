ActiveAdmin.register Reservation do
  permit_params :user_id, :pnr_id, :price

  form do |f|
    f.inputs do
      f.input :user
      f.input :pnr
    end
    f.actions
  end

  controller do
    def scoped_collection
      Reservation.includes(:user, :pnr)
    end
  end
end
