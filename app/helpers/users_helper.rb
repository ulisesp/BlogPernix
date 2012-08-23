module UsersHelper
	def login?
		session[:user_id].present?
	end
end
