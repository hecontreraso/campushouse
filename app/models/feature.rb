# == Schema Information
#
# Table name: features
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Feature < ActiveRecord::Base
	has_many :residence_features
	has_many :residences, through: :residence_features

  validates :name, length: { maximum: 32 }
end
