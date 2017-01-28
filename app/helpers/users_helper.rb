module UsersHelper

	  # Logs in the given user.
  def is_admin?()
    role = User.find(session[:user_id]).admin
  end

end
