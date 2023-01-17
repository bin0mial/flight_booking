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
require 'rails_helper'

RSpec.describe Aeroplane, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
