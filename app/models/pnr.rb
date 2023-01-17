# == Schema Information
#
# Table name: pnrs
#
#  id                      :bigint           not null, primary key
#  pnr                     :string           not null
#  created_at              :datetime         not null
#  updated_at              :datetime         not null
#  aeroplane_class_id      :bigint           not null
#  aeroplane_class_seat_id :bigint           not null
#  flight_id               :bigint           not null
#
# Indexes
#
#  index_pnrs_on_aeroplane_class_id       (aeroplane_class_id)
#  index_pnrs_on_aeroplane_class_seat_id  (aeroplane_class_seat_id)
#  index_pnrs_on_flight_id                (flight_id)
#  index_pnrs_on_flight_id_and_pnr        (flight_id,pnr) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (aeroplane_class_id => aeroplane_classes.id)
#  fk_rails_...  (aeroplane_class_seat_id => aeroplane_class_seats.id)
#  fk_rails_...  (flight_id => flights.id)
#
class Pnr < ApplicationRecord
  # Associations
  belongs_to :flight
  belongs_to :aeroplane_class
  belongs_to :aeroplane_class_seat
  has_one :reservation, dependent: :destroy
  has_one :user, through: :reservation

  # Scopes
  scope :available, -> { where.missing :reservation }

  delegate :price, to: :aeroplane_class_seat, prefix: true

  alias_attribute :name, :pnr
end
