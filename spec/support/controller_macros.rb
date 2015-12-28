module ControllerMacros
  def login_student
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:student]
      student = FactoryGirl.create(:student)
      sign_in student
    end
  end
end