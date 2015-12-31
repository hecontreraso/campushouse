module ApplicationHelper
 #  def current_user
	#   current_student || current_owner
	# end

	def resource
		@user ||= User.new
	end

	# def user_signed_in?
	# 	student_signed_in? || owner_signed_in? 
	# end

 #  def student_devise_mapping
 #    @student_devise_mapping ||= Devise.mappings[:student]
 #  end

 #  def owner_devise_mapping
 #    @owner_devise_mapping ||= Devise.mappings[:owner]
 #  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
