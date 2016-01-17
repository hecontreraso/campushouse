# == Schema Information
#
# Table name: universities
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  search_term :string           not null
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

require 'rails_helper'

RSpec.describe University, type: :model do
  context 'validations' do
    it { should have_many(:students) }
    it { should validate_length_of(:name).is_at_most(64) }
  end
end
