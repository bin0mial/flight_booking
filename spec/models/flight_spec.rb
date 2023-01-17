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
require 'rails_helper'

RSpec.describe Flight, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
