module UsersHelper
	def is_admin?
		if current_user.group[:level] == 0
			return true
		else 
			return false
		end
	end
end
