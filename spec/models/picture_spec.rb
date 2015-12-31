# == Schema Information
#
# Table name: pictures
#
#  id           :integer          not null, primary key
#  url          :string
#  residence_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

RSpec.describe Picture, type: :model do
	context 'validations' do
 		it { should belong_to(:residence) }
 	end
end
