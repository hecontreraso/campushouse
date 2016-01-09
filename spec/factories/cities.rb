# == Schema Information
#
# Table name: cities
#
#  id   :integer          not null, primary key
#  name :string
#

FactoryGirl.define do
  factory :city do
    name "MyCity"
  end
end
