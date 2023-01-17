# == Schema Information
#
# Table name: aeroplane_class_seats
#
#  id                 :bigint           not null, primary key
#  price              :float            not null
#  row_numbers        :integer          not null
#  row_seats          :integer          not null
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  aeroplane_class_id :bigint           not null
#  aeroplane_id       :bigint           not null
#
# Indexes
#
#  index_aeroplane_class_seats_on_aeroplane_and_aeroplane_class  (aeroplane_id,aeroplane_class_id) UNIQUE
#  index_aeroplane_class_seats_on_aeroplane_class_id             (aeroplane_class_id)
#  index_aeroplane_class_seats_on_aeroplane_id                   (aeroplane_id)
#
# Foreign Keys
#
#  fk_rails_...  (aeroplane_class_id => aeroplane_classes.id)
#  fk_rails_...  (aeroplane_id => aeroplanes.id)
#
require 'rails_helper'

RSpec.describe AeroplaneClassSeat, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
