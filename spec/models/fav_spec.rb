# == Schema Information
#
# Table name: favs
#
#  id           :integer          not null, primary key
#  student_id   :integer
#  residence_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Fav, type: :model do
	context 'validations' do
  	it { should belong_to(:student) }
 		it { should belong_to(:residence) }
 	end
end
