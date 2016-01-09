# == Schema Information
#
# Table name: search_points
#
#  id         :integer          not null, primary key
#  input      :string           not null
#  hits       :integer          default(0)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe SearchPoint, type: :model do
  context 'validations' do
    it { should validate_presence_of(:input) }
		it { should validate_length_of(:input).is_at_most(128) }
  end
end
