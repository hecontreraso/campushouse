require 'rails_helper'

RSpec.describe "residences/edit", type: :view do
  before(:each) do
    @residence = assign(:residence, create(:residence))
  end

  it "renders the edit residence form" do
    render

    assert_select "form[action=?][method=?]", residence_path(@residence), "post" do
      assert_select "input#residence_name[name=?]", "residence[name]"
      assert_select "input#residence_address[name=?]", "residence[address]"
      assert_select "input#residence_price[name=?]", "residence[price]"
      assert_select "input#residence_square_meters[name=?]", "residence[square_meters]"
      assert_select "textarea#residence_description[name=?]", "residence[description]"
      assert_select "input#residence_rooms[name=?]", "residence[rooms]"
    end
  end
end
