class SessionsController < ApplicationController

	def new
		
	end

	def create
		user = User.find_by_email(params[:session][:email])
		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:success] = "Let's go chatting!"
			redirect_back_or user
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
