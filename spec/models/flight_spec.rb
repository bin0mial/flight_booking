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
require 'rails_helper'

RSpec.describe Flight, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
