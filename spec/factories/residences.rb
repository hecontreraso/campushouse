# == Schema Information
#
# Table name: residences
#
#  id            :integer          not null, primary key
#  name          :string
#  address       :string           not null
#  price         :decimal(7, )     not null
#  square_meters :integer
#  description   :text
#  rooms         :integer
#  user_id       :integer
#  archived      :boolean          default(FALSE)
#  latitude      :float
#  longitude     :float
#  city_id       :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do

  factory :residence do
    name "Name"
		address "Address"
		price 450_000
		square_meters 10
		description "MyText"
		rooms 2
		user
		city
		before(:create) do |residence|
		  residence.pictures = [FactoryGirl.build(:picture)]
	  end
  end

end
