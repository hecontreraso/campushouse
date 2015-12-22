# == Schema Information
#
# Table name: residences
#
#  id            :integer          not null, primary key
#  name          :string
#  price         :decimal(7, )     not null
#  square_meters :integer
#  description   :text
#  rooms         :integer
#  owner_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe Residence, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
