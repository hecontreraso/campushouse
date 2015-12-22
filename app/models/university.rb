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

class University < ActiveRecord::Base
	has_many :students, inverse_of: :university

	has_many :university_residences
	has_many :residences, through: :university_residences

  validates :name, length: { maximum: 64 }
  validates :address, presence: true, length: { maximum: 200 }
end
