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

FactoryGirl.define do
  factory :university do
    name 'Test university name'
  end

end
