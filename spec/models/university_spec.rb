# == Schema Information
#
# Table name: universities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  address    :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'rails_helper'

RSpec.describe University, type: :model do
  context 'validations' do
    it { should have_many(:students) }
    it { should have_many(:university_residences) }
    it { should have_many(:residences).through(:university_residences) }

    it { should validate_length_of(:name).is_at_most(64) }
    it { should validate_presence_of(:address) }
    it { should validate_length_of(:address).is_at_most(200) }
  end
end
