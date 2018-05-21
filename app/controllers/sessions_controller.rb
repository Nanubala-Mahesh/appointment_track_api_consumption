class SessionsController < ApplicationController
	# require 'httparty'
	skip_before_action :verify_authenticity_token
	
    # User Sign up service. Currently not in use
	def sign_up
		if request.post?
			if params[:email] && params[:password]
				@user = HTTParty.post("http://localhost:3000/users/", body: {user: {email: params[:email], password: params[:password], password_confirmation: params[:password]}})	
				# binding.pry
				@user = JSON.parse(@user.body)

				# binding.pry
				if @user["success"]
					redirect_to root_path(:acess_token => @user["data"]["acess_token"])
				else
					# binding.pry
					redirect_to sessions_sign_up_path, notice:  "#{params[:email]}" +  " #{@user['data']['email'][0]}"
				end
			end		
		end
	end

    # User Sign in service.
	def sign_in
		if request.post?
			if params[:email] && params[:password]
				@user = HTTParty.post("http://localhost:3000/users/sign_in", body: {email: params[:email], password: params[:password], password_confirmation: params[:password]})	
				# binding.pry
				@user = JSON.parse(@user.body)

				# binding.pry
				if @user['success'] 
					redirect_to root_path(acess_token: "#{@user['data']['acess_token']}")
				else
					render sign_in
				end
			end		
		end		
	end

	def logout
		@user = HTTParty.patch("http://localhost:3000/users/sign_in", body: {acess_token: params[:acess_token]})
		redirect_to sessions_sign_in_path
	end

	private
	
	def user_params
		params.require(:user).permit(:email,:phone, :password, :password_confirmation, :acess_token, :authentication_token )#, :otp )
		 # params.require(:user).permit(User::PermittedAttributes.user_attributes)
	end

	# def rand_string(len)
	# 	o =  [('a'..'z'),('A'..'Z')].map{|i| i.to_a}.flatten
	# 	string  =  (0..len).map{ o[rand(o.length)]  }.join
	# 	return string
	# end 
end