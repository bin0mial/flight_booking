# == Schema Information
#
# Table name: flights
#
#  id           :bigint           not null, primary key
#  at           :datetime         not null
#  destination  :string           not null
#  origin       :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  aeroplane_id :bigint           not null
#
# Indexes
#
#  index_flights_on_aeroplane_id  (aeroplane_id)
#
# Foreign Keys
#
#  fk_rails_...  (aeroplane_id => aeroplanes.id)
#
class Flight < ApplicationRecord
  belongs_to :aeroplane
  has_many :pnrs
  has_many :users, through: :pnrs
  has_many :aeroplane_class_seats, through: :aeroplane

  after_create :create_pnrs

  # Delegations
  delegate :available, to: :pnrs, prefix: true

  set_printable_attributes :origin, :destination, :at

  def create_pnrs
    CreateFlightPnrsJob.perform_later self
  end

  def name
    "#{aeroplane.name}_#{origin}_#{destination}"
  end
end
