# == Schema Information
#
# Table name: features
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe Feature, type: :model do
	context 'validations' do
  	it { should have_many(:residence_features) }
		it { should have_many(:residences).through(:residence_features) }
    
    it { should validate_length_of(:name).is_at_most(32) }
	end
end
