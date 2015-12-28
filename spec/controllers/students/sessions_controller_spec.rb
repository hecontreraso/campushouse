require 'rails_helper'

RSpec.describe Students::SessionsController, type: :controller do
  
  # /resource/sign_in
  describe 'POST #create' do
	  login_student

	  it "should have a current_student" do
	    # note the fact that you should remove the "validate_session" parameter if this was a scaffold-generated controller
	    expect(subject.current_student).to_not eq(nil)
	  end
  end

end


