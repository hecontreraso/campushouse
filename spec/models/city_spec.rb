# == Schema Information
#
# Table name: cities
#
#  id   :integer          not null, primary key
#  name :string
#

require 'rails_helper'

RSpec.describe City, type: :model do
	context 'validations' do
		it { should have_many(:residences) }
    
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(32) }
	end
end
