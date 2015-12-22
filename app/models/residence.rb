# == Schema Information
#
# Table name: residences
#
#  id            :integer          not null, primary key
#  name          :string
#  price         :decimal(7, )     not null
#  square_meters :integer
#  description   :text
#  rooms         :integer
#  owner_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class Residence < ActiveRecord::Base
	has_many :pictures
end
