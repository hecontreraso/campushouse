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

class Residence < ActiveRecord::Base

	belongs_to :user, inverse_of: :published_residences
	
  has_many :pictures, inverse_of: :residence, dependent: :destroy
  accepts_nested_attributes_for :pictures, allow_destroy: true

	has_many :ratings
  belongs_to :city, inverse_of: :residences

	# List of features of this residence
	has_many :residence_features
	has_many :features, through: :residence_features

	# Students who faved this residence
	has_many :favs
	has_many :students_who_faved, through: :favs, class_name: 'User'

  validates :name, length: { maximum: 32 }, presence: true
  validates :address, length: { maximum: 64 }, presence: true
  validates :price, numericality: {
    greater_than_or_equal_to: 100_000,
    less_than_or_equal_to: 5_000_000
  }, presence: true
  validates :square_meters, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 300
  }, allow_nil: true
  validates :description, length: { maximum: 1000 }, presence: true
  validates :rooms, numericality: {
    greater_than_or_equal_to: 1,
    less_than_or_equal_to: 100
  }, allow_nil: true
  validates :city, presence: true

  geocoded_by :address

  after_validation :geocode, if: ->{ Rails.env.production? }
  before_validation :format_address

  scope :active, ->{ where(archived: false) }

  def archive
    self.update(archived: true)
  end

  private

  # attach the name of the city to be correctly geocoded
  def format_address
    self.address = "#{address}, #{city.name}" unless address.nil? || city.nil?
  end

end
