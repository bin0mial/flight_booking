# == Schema Information
#
# Table name: reservations
#
#  id         :integer          not null, primary key
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pnr_id     :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_reservations_on_pnr_id   (pnr_id)
#  index_reservations_on_user_id  (user_id)
#
# Foreign Keys
#
#  pnr_id   (pnr_id => pnrs.id)
#  user_id  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Reservation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
