# == Schema Information
#
# Table name: residences
#
#  id            :integer          not null, primary key
#  name          :string
#  address       :string           not null
#  price         :decimal(7, )     not null
#  square_meters :integer
#  description   :text
#  rooms         :integer
#  user_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  archived      :boolean          default(FALSE)
#

require 'rails_helper'

RSpec.describe Residence, type: :model do
	context 'validations' do
		it { should belong_to :user }
		it { should have_many(:pictures) }
		it { should have_many(:ratings) }
		it { should have_many(:university_residences) }
		it { should have_many(:universities).through(:university_residences) }
		it { should have_many(:residence_features) }
		it { should have_many(:features).through(:residence_features) }
		it { should have_many(:favs) }
		it { should have_many(:students_who_faved).through(:favs) }

		it { should validate_presence_of(:name) }
		it { should validate_length_of(:name).is_at_most(32) }
		it { should validate_presence_of(:address) }
		it { should validate_length_of(:address).is_at_most(64) }
		it { should validate_length_of(:description).is_at_most(1000) }
		
		it { should validate_presence_of(:price) }
		it do
			should validate_numericality_of(:price)
				.is_greater_than_or_equal_to(100_000)
				.is_less_than_or_equal_to(5_000_000)
		end
		it do
			should validate_numericality_of(:square_meters)
				.is_greater_than_or_equal_to(1)
				.is_less_than_or_equal_to(300)
		end
		it do
			should validate_numericality_of(:rooms)
				.is_greater_than_or_equal_to(1)
				.is_less_than_or_equal_to(100)
		end
	end

end
