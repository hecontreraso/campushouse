# == Schema Information
#
# Table name: students
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
#  university_id          :integer
#  semester               :integer
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
	sequence(:email) { |n| "user#{n}@example.com" }

  factory :student do
    name 'Lorem Smith'
    university
    semester 1
    email
    password '12345678'
    password_confirmation '12345678'
  end

end
