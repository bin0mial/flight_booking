# == Schema Information
#
# Table name: pnrs
#
#  id                 :integer          not null, primary key
#  pnr                :string           not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  aeroplane_class_id :integer          not null
#  flight_id          :integer          not null
#
# Indexes
#
#  index_pnrs_on_aeroplane_class_id  (aeroplane_class_id)
#  index_pnrs_on_flight_id           (flight_id)
#  index_pnrs_on_flight_id_and_pnr   (flight_id,pnr) UNIQUE
#
# Foreign Keys
#
#  aeroplane_class_id  (aeroplane_class_id => aeroplane_classes.id)
#  flight_id           (flight_id => flights.id)
#
class Pnr < ApplicationRecord
  # Associations
  belongs_to :flight
  belongs_to :aeroplane_class
  has_one :reservation, dependent: :destroy
  has_one :user, through: :reservation

  # Scopes
  scope :available, -> { where reservations: nil }

  alias_attribute :name, :pnr
end
