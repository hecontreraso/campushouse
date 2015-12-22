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

require 'rails_helper'

RSpec.describe Fav, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
