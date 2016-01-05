# == Schema Information
#
# Table name: pictures
#
#  id           :integer          not null, primary key
#  picture      :string
#  residence_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :picture do
		picture "dummy_image_url"
  end
end
