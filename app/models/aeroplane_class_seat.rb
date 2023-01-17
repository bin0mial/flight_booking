# == Schema Information
#
# Table name: aeroplane_class_seats
#
#  id                 :integer          not null, primary key
#  price              :float            not null
#  row_numbers        :integer          not null
#  row_seats          :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  aeroplane_class_id :integer          not null
#  aeroplane_id       :integer          not null
#
# Indexes
#
#  index_aeroplane_class_seats_on_aeroplane_and_aeroplane_class  (aeroplane_id,aeroplane_class_id) UNIQUE
#  index_aeroplane_class_seats_on_aeroplane_class_id             (aeroplane_class_id)
#  index_aeroplane_class_seats_on_aeroplane_id                   (aeroplane_id)
#
# Foreign Keys
#
#  aeroplane_class_id  (aeroplane_class_id => aeroplane_classes.id)
#  aeroplane_id        (aeroplane_id => aeroplanes.id)
#
class AeroplaneClassSeat < ApplicationRecord
  belongs_to :aeroplane
  belongs_to :aeroplane_class
  has_many :pnrs

  validates :aeroplane_id, uniqueness: { scope: :aeroplane_class_id }
  validates :aeroplane_id, :aeroplane_class_id, :price, :row_numbers, :row_seats, presence: true
end
