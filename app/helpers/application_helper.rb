module ApplicationHelper
  def current_user
	  current_student || current_owner
	end

	def user_signed_in?
		student_signed_in? || owner_signed_in? 
	end
# TODO  check if there is repetition after owner login is implemented
	def student_resource_name
		:student
	end

	def student_resource
    @resource ||= Student.new
  end
 
  def student_devise_mapping
    @devise_mapping ||= Devise.mappings[:student]
  end

end
