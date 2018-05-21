Rails.application.routes.draw do

	# devise_for :users

	# post 'data_entries/home'
  	# post 'data_entries/create_patient'

	root to: 'data_entries#home'
	
	get 'data_entries/home'

	get 'sessions/sign_in'
	post 'sessions/sign_in'

	get 'sessions/sign_up'
	post 'sessions/sign_up'

	post 'sessions/logout'

	# post    'data_entries/sign_in'
	# get    'data_entries/sign_in'


	post    'create_patient'                => 'data_entries#create_patient'
	
	post    'create_doctor'                => 'data_entries#create_doctor'
	post    'create_appointment'                => 'data_entries#create_appointment'


      # devise_for :users, controllers: {
      #   sessions: 'users/sessions'
      # }
	# devise_for :users, controllers: {
	# 	sessions: 'users/sessions'
	# }



	# post 'create_doctor', to: 'data_entriescreate_doctor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
