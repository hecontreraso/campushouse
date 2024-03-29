# == Schema Information
#
# Table name: ratings
#
#  id           :integer          not null, primary key
#  residence_id :integer
#  comment      :string
#  value        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Rating < ActiveRecord::Base
	belongs_to :residence

  validates :comment, length: { maximum: 500 }
  validates :value, numericality: {
  	greater_than_or_equal_to: 1,
  	less_than_or_equal_to: 5
  }
end
