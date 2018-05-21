class DataEntriesController < ApplicationController
	
	before_action :check_acess_token 

	def home
		# binding.pry

		# Token token=qYhItToDRNpSiqjBdfkBg

		@appointments = HTTParty.get("https://safe-sierra-38835.herokuapp.com/appointments", :headers => {Authorization: "Token token = #{params[:acess_token]}"  } )
		
		@patients = HTTParty.get("https://safe-sierra-38835.herokuapp.com/patients", :headers => {Authorization: "Token token = #{params[:acess_token]}" })

		# binding.pry
		@patients = JSON.parse(@patients.body)


		@doctors = HTTParty.get("https://safe-sierra-38835.herokuapp.com/doctors", :headers => {Authorization: "Token token = #{params[:acess_token]}" })
		# binding.pry
		@doctors = JSON.parse(@doctors.body)
	end

	def create_patient
		# binding.pry
		@patient = HTTParty.post("https://safe-sierra-38835.herokuapp.com/patients", body: {patient: {name: params[:name], phone_number: params[:phone_number]}}, :headers => {Authorization: "Token token = #{params[:acess_token]}" })
		# binding.pry
		redirect_to root_path(acess_token: params[:acess_token])
	end


	def create_doctor
		@doctor = HTTParty.post("https://safe-sierra-38835.herokuapp.com/doctors", body: {doctor: {name: params[:name], phone_number: params[:phone_number], specialization: params[:specialization]}}, :headers => {Authorization: "Token token = #{params[:acess_token]}" })
		redirect_to root_path(acess_token: params[:acess_token])
	end

	def create_appointment
		@appointment = HTTParty.post("https://safe-sierra-38835.herokuapp.com/appointments", body: {appointment: {patient_id: params[:patient_id], doctor_id: params[:doctor_id], diseases: params[:diseases]}}, :headers => {Authorization: "Token token = #{params[:acess_token]}" }) 
		# binding.pry
		redirect_to root_path(acess_token: params[:acess_token])
	end

	def show_appointments
		@appointment = HTTParty.get("https://safe-sierra-38835.herokuapp.com/appointments", :headers => {Authorization: "Token token = #{params[:acess_token]}}" })		
	end

	private
	def check_acess_token
		user = HTTParty.get("https://safe-sierra-38835.herokuapp.com/users", body: {acess_token: params[:acess_token]})
		# binding.pry
		@user = JSON.parse(user.body)

		if @user["success"] == false
			redirect_to sessions_sign_in_path, notice: 'Please Sign in'
		end
	end
end