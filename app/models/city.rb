# == Schema Information
#
# Table name: cities
#
#  id   :integer          not null, primary key
#  name :string
#

class City < ActiveRecord::Base
	has_many :residences, inverse_of: :city
	
  validates :name, length: { maximum: 32 }, presence: true
end
