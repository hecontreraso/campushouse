# == Schema Information
#
# Table name: universities
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :university do
    name 'Test university name'
  end

end
