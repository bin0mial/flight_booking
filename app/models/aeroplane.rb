# == Schema Information
#
# Table name: aeroplanes
#
#  id             :bigint           not null, primary key
#  aeroplane_type :string           not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
# Indexes
#
#  index_aeroplanes_on_aeroplane_type  (aeroplane_type) UNIQUE
#
class Aeroplane < ApplicationRecord
  has_many :aeroplane_class_seats
  has_many :aeroplane_classes, through: :aeroplane_class_seats
  has_many :flights
  has_many :pnrs, through: :flights

  alias_attribute :name, :aeroplane_type
end
