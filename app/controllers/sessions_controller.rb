class SessionsController < ApplicationController

  skip_before_action :ensure_login, only: [:new, :create]

  def new
  	# Muestra la pagina de login
  end

  def create
  	user = User.find_by(email: params[:user][:email])
  	password = params[:user][:password]

  	if user && user.authenticate(password)
  		session[:user_id] = user.id
  		redirect_to root_path, notice: "Logged in successfully"
  	else
  		redirect_to login_path, notice: "Invalid username/password combination"
  	end

  end

  def destroy
    reset_session #Elimina la session y todo lo que esta contiene
    redirect_to login_path, notice: "You have been logged out"
  end
end
