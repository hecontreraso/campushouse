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

FactoryGirl.define do
  factory :rating do
    
  end

end
