class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  


 #  private
 #  	def check_for_valid_authtoken

	# 	@user = HTTParty.get("http://localhost:3000/users?email=" + "#{params[:email]}" )
	# 	@user = JSON.parse(@user.body)

	# 	binding.pry
		
	# 	# @user = User.where(:acess_token => token).first  if   !User.where(:acess_token => token).first.nil?  
		
	# 	if !@user 
	# 		render json: Response.new.success('Please Login', nil)   
	# 	else
	# 		binding.pry
	# 		redirect_to root_path, user: @user, flash: { header: @user.acess_token }
	# 		# redirect_to controller: 'thing', action: 'edit', id: 3, something: 'else'

	# 		# render json: Response.new.success('Sign in', @user)
	# 		# return true
	# 	end
	# end
	
	# 	authenticate_or_request_with_http_token do |token, options|   
	# 		puts token  

		  	
	# 	  	@user = JSON.parse(@user.body)
		  
	# 		@user = User.where(:acess_token => token).first  if   !User.where(:acess_token => token).first.nil?  
	# 		if !@user 
	# 			render json: Response.new.success('Please Login', nil)   
	# 		else
	# 			redirect_to root_path, user: @user
	# 			binding.pry
	# 			# redirect_to controller: 'thing', action: 'edit', id: 3, something: 'else'

	# 			# render json: Response.new.success('Sign in', @user)
	# 			return true
	# 		end
	# 	end
	# end
end



