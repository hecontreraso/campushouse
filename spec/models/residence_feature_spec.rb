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

require 'rails_helper'

RSpec.describe ResidenceFeature, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
