require 'rails_helper'

RSpec.describe "residences/new", type: :view do
  before(:each) do
    assign(:residence, FactoryGirl.build(:residence))
  end

  it "renders new residence form" do
    render

    assert_select "form[action=?][method=?]", residences_path, "post" do
      assert_select "input#residence_name[name=?]", "residence[name]"
      assert_select "input#residence_address[name=?]", "residence[address]"
      assert_select "input#residence_price[name=?]", "residence[price]"
      assert_select "input#residence_square_meters[name=?]", "residence[square_meters]"
      assert_select "textarea#residence_description[name=?]", "residence[description]"
      assert_select "input#residence_rooms[name=?]", "residence[rooms]"
    end
  end
end
