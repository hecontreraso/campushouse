require 'devise'
require 'support/devise_helpers'

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include Devise::TestHelpers, type: :helper

  config.include DeviseHelpers, :type => :controller
end