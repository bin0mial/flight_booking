# == Schema Information
#
# Table name: reservations
#
#  id         :bigint           not null, primary key
#  price      :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  pnr_id     :bigint           not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_reservations_on_pnr_id   (pnr_id)
#  index_reservations_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (pnr_id => pnrs.id)
#  fk_rails_...  (user_id => users.id)
#
require 'rails_helper'

RSpec.describe Reservation, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
