require 'rails_helper'

RSpec.describe "residences/index", type: :view do
  before(:each) do
    assign(:residences, [create(:residence), create(:residence)])
  end

  it "renders a list of residences" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Address".to_s, :count => 2
    assert_select "tr>td", :text => "450000".to_s, :count => 2
    assert_select "tr>td", :text => 10.to_s, :count => 2
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
