# == Schema Information
#
# Table name: favs
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  residence_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Fav < ActiveRecord::Base
	belongs_to :user
	belongs_to :residence
end
