require 'rails_helper'

RSpec.describe "residences/show", type: :view do
  before(:each) do
    assign(:residence, create(:residence))
    assign(:pictures, [create(:picture)])
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/450000/)
    expect(rendered).to match(/10/)
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/picture-container/)
  end
end
