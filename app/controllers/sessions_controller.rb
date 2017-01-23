class SessionsController < ApplicationController

  skip_before_action :ensure_login, only: [:new, :create]

  def new
  	# Muestra la pagina de login
  end

  def create
  	user = User.find_by(email: params[:user][:email])
  	password = params[:user][:password]

  	if user && user.authenticate(password)

      if user.status?
  		  log_in user # Helper methdod in session helper
  		  redirect_to root_path, notice: "Logged in successfully"
      else
        redirect_to login_path, notice: "Account not activated. Check your email for the activation link. "
      end

  	else
  		redirect_to login_path, notice: "Invalid username/password combination"
  	end

  end

  def destroy
    reset_session #Elimina la session y todo lo que esta contiene
    redirect_to login_path, notice: "You have been logged out"
  end
end
