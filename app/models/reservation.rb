# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pnr_id     :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_reservations_on_pnr_id   (pnr_id)
#  index_reservations_on_user_id  (user_id)
#
# Foreign Keys
#
#  pnr_id   (pnr_id => pnrs.id)
#  user_id  (user_id => users.id)
#
class Reservation < ApplicationRecord
  belongs_to :user
  belongs_to :pnr

  validate :check_pnr_not_taken, on: :create

  before_create :add_price_to_reservation

  def check_pnr_not_taken
    errors.add(:pnr, :taken) if pnr.user.present?
  end

  def add_price_to_reservation
    self.price = pnr.aeroplane_class_seat_price
  end
end
