# == Schema Information
#
# Table name: residence_features
#
#  id           :integer          not null, primary key
#  feature_id   :integer
#  residence_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class ResidenceFeature < ActiveRecord::Base
end
