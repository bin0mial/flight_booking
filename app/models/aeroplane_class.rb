# == Schema Information
#
# Table name: aeroplane_classes
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AeroplaneClass < ApplicationRecord
  has_many :aeroplane_class_seats
  has_many :aeroplanes, through: :aeroplane_class_seats
  has_many :pnrs
end
