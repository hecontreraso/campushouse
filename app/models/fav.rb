# == Schema Information
#
# Table name: favs
#
#  id            :integer          not null, primary key
#  student_id    :integer
#  university_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Fav < ActiveRecord::Base
end
