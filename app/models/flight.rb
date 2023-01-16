# == Schema Information
#
# Table name: flights
#
#  id           :integer          not null, primary key
#  at           :datetime         not null
#  destination  :string           not null
#  origin       :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  aeroplane_id :integer          not null
#
# Indexes
#
#  index_flights_on_aeroplane_id  (aeroplane_id)
#
# Foreign Keys
#
#  aeroplane_id  (aeroplane_id => aeroplanes.id)
#
class Flight < ApplicationRecord
  belongs_to :aeroplane
  has_many :pnrs
  has_many :users, through: :pnrs
  has_many :aeroplane_class_seats, through: :aeroplane

  after_create :create_pnrs

  def create_pnrs
    ::Pnrs::CreatePnrService.new(self).call
  end
end
