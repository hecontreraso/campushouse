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
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do
  factory :residence do
    
  end

end
