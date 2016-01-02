# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  owner_enabled          :boolean          default(FALSE)
#  university_id          :integer
#  semester               :integer
#  avatar                 :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#

FactoryGirl.define do
	sequence :email do |n|
		"email#{n}@factory.com"
  end

  factory :user do
		name 'Lorem Smith'
		email
		password '12345678'
		password_confirmation '12345678'

		trait :student do
			university
			semester 1.to_i
		end

		trait :owner do
			owner_enabled true
		end
  end

end
