# == Schema Information
#
# Table name: residence_features
#
#  id           :integer          not null, primary key
#  feature_id   :integer
#  residence_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe ResidenceFeature, type: :model do
	context 'validations' do
  	it { should belong_to(:feature) }
  	it { should belong_to(:residence) }
	end
end
