class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			redirect_to root_url
			flash.now[:success] = "Let's go chatting! "
		else
			flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      		render 'new'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to root_url
	end

end
