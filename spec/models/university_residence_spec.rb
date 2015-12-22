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
  pending "add some examples to (or delete) #{__FILE__}"
end
