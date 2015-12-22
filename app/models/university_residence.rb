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

class UniversityResidence < ActiveRecord::Base
end
