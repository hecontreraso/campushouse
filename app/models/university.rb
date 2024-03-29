# == Schema Information
#
# Table name: universities
#
#  id          :integer          not null, primary key
#  name        :string           not null
#  search_term :string           not null
#  latitude    :float
#  longitude   :float
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class University < ActiveRecord::Base
	has_many :students, inverse_of: :university, class_name: 'User'

  validates :name, length: { maximum: 64 }
end
