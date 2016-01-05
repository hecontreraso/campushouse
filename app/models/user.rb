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

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :published_residences, class_name: 'Residence'
  # Where the user studies
  belongs_to :university, inverse_of: :students
  # Faved residences
  has_many :favs
  has_many :faved_residences, through: :favs, class_name: 'Residence'

  validates :name, length: { maximum: 32 }, presence: true
  validates :semester, numericality: {
  	greater_than_or_equal_to: 1,
  	less_than_or_equal_to: 12,
    allow_nil: true
  }
end
