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

class ResidenceSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :picture, :latitude, :longitude

  def picture
  	object.pictures.first.medium.url
  end
end
