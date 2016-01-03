require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ListingsHelper. For example:
#
# describe ListingsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ApplicationHelper, type: :helper do

	describe "#link_to" do
    it "asks for login when user is not logged in" do
      expect(
      	helper.link_to("Publica tu residencia", residences_path, require_login: true, class: 'btn')
      ).to eq("<a require_login=\"true\" class=\"btn loginModalShow\" href=\"#\">Publica tu residencia</a>")
    end

    it "redirects to destination when user is logged in" do
      sign_in(create(:user))
      expect(
      	helper.link_to("Publica tu residencia", residences_path, require_login: true, class: 'btn')
      ).to eq("<a require_login=\"true\" class=\"btn\" href=\"/residences\">Publica tu residencia</a>")
    end
  end
  
end
