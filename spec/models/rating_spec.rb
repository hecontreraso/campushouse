# == Schema Information
#
# Table name: ratings
#
#  id           :integer          not null, primary key
#  residence_id :integer
#  comment      :string
#  value        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Rating, type: :model do
	context 'validations' do
 		it { should belong_to(:residence) }

    it { should validate_length_of(:comment).is_at_most(500) }
  	it do
			should validate_numericality_of(:value)
				.is_greater_than_or_equal_to(1)
				.is_less_than_or_equal_to(5)
		end
 	end
end
