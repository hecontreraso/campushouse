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

class Picture < ActiveRecord::Base
	belongs_to :residence
end
