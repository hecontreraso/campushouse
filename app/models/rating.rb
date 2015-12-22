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
end
