require 'rails_helper'

RSpec.describe "residences/index", type: :view do
  # before(:each) do
  #   assign(:residences, [
  #     Residence.create!(
  #       :name => "Name",
  #       :address => "Address",
  #       :price => "",
  #       :price => "",
  #       :square_meters => 1,
  #       :description => "MyText",
  #       :rooms => 2,
  #       :user => nil
  #     ),
  #     Residence.create!(
  #       :name => "Name",
  #       :address => "Address",
  #       :price => "",
  #       :price => "",
  #       :square_meters => 1,
  #       :description => "MyText",
  #       :rooms => 2,
  #       :user => nil
  #     )
  #   ])
  # end

  # it "renders a list of residences" do
  #   render
  #   assert_select "tr>td", :text => "Name".to_s, :count => 2
  #   assert_select "tr>td", :text => "Address".to_s, :count => 2
  #   assert_select "tr>td", :text => "".to_s, :count => 2
  #   assert_select "tr>td", :text => "".to_s, :count => 2
  #   assert_select "tr>td", :text => 1.to_s, :count => 2
  #   assert_select "tr>td", :text => "MyText".to_s, :count => 2
  #   assert_select "tr>td", :text => 2.to_s, :count => 2
  #   assert_select "tr>td", :text => nil.to_s, :count => 2
  # end
end
