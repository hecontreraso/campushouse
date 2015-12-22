# == Schema Information
#
# Table name: university_residences
#
#  id            :integer          not null, primary key
#  university_id :integer
#  residence_id  :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'rails_helper'

RSpec.describe UniversityResidence, type: :model do
  context 'validations' do
	  it { should belong_to(:university) }
	  it { should belong_to(:residence) }
	end
end
