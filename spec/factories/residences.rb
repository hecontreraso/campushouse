FactoryGirl.define do
  factory :residence do
    name "Name"
		address "Address"
		price 450_000
		square_meters 10
		description "MyText"
		rooms 2
		user
  end

end
