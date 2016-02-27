module SessionsHelper

	def current_user
	    @current_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def redirect_back_or(default)
	    redirect_to(session[:forwarding_url] || default)
	    session.delete(:forwarding_url)
	end

	def store_location
	    session[:forwarding_url] = request.url if request.get?
	end

end
