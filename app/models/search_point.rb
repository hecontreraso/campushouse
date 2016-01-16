# == Schema Information
#
# Table name: search_points
#
#  id         :integer          not null, primary key
#  input      :string           not null
#  hits       :integer          default(0)
#  latitude   :float
#  longitude  :float
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class SearchPoint < ActiveRecord::Base
  validates :input, length: { maximum: 128 }, presence: true

  geocoded_by :input
  after_validation :geocode
end
