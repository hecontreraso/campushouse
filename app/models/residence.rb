# == Schema Information
#
# Table name: residences
#
#  id            :integer          not null, primary key
#  name          :string
#  price         :decimal(7,0)     not null
#  square_meters :integer
#  description   :text
#  rooms         :integer
#  owner_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Residence < ActiveRecord::Base
	belongs_to :owner
	has_many :pictures
	has_many :ratings

	# Universities close to this residence
	has_many :university_residences
	has_many :universities, through: :university_residences

	# List of features of this residence
	has_many :residence_features
	has_many :features, through: :residence_features

	# Students which faved this residence
	has_many :favs
	has_many :students, through: :favs

  validates :name, length: { maximum: 32 }
  validates :price, numericality: {
  	greater_than_or_equal_to: 100_000,
  	less_than_or_equal_to: 5_000_000
  }
  validates :square_meters, numericality: {
  	greater_than_or_equal_to: 5,
  	less_than_or_equal_to: 300
  }
  validates :description, length: { maximum: 1000 }
  validates :rooms, numericality: {
  	greater_than_or_equal_to: 1,
  	less_than_or_equal_to: 100
  }
  validates :address, presence: true, length: { maximum: 64 }
end
