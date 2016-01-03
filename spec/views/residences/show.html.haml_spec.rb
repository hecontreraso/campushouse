require 'rails_helper'

RSpec.describe "residences/show", type: :view do
  before(:each) do
    @residence = assign(:residence, create(:residence))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/450000/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
  end
end
