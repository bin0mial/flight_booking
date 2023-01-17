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
require 'rails_helper'

RSpec.describe Pnr, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
