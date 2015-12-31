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

require 'rails_helper'

RSpec.describe Student, type: :model do
  context 'validations' do
    it { should belong_to :university }
    it { should have_many(:favs) }
    it { should have_many(:residences).through(:favs) }
    
    it { should validate_presence_of(:name) }
    it { should validate_length_of(:name).is_at_most(32) }
    it do
    	should validate_numericality_of(:semester)
    		.is_greater_than_or_equal_to(1)
    		.is_less_than_or_equal_to(12)
    end
  end
end
