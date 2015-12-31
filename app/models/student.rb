# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  name                   :string           not null
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

class Student < User
  # Where the student studies
  belongs_to :university, inverse_of: :students
  # Faved residences
  has_many :favs
  has_many :residences, through: :favs

  validates :semester, numericality: {
  	greater_than_or_equal_to: 1,
  	less_than_or_equal_to: 12
  }
end
