class DataEntriesController < ApplicationController
	
	before_action :check_acess_token 

	def home
		# binding.pry

		# Token token=qYhItToDRNpSiqjBdfkBg

		@appointments = HTTParty.get("http://localhost:3000/appointments", :headers => {Authorization: "Token token = #{params[:acess_token]}"  } )
		
		@patients = HTTParty.get("http://localhost:3000/patients", :headers => {Authorization: "Token token = #{params[:acess_token]}" })

		# binding.pry
		@patients = JSON.parse(@patients.body)


		@doctors = HTTParty.get("http://localhost:3000/doctors", :headers => {Authorization: "Token token = #{params[:acess_token]}" })
		# binding.pry
		@doctors = JSON.parse(@doctors.body)
	end

	def create_patient
		# binding.pry
		@patient = HTTParty.post("http://localhost:3000/patients", body: {patient: {name: params[:name], phone_number: params[:phone_number]}}, :headers => {Authorization: "Token token = #{params[:acess_token]}" })
		# binding.pry
		redirect_to root_path(acess_token: params[:acess_token])
	end


	def create_doctor
		@doctor = HTTParty.post("http://localhost:3000/doctors", body: {doctor: {name: params[:name], phone_number: params[:phone_number], specialization: params[:specialization]}}, :headers => {Authorization: "Token token = #{params[:acess_token]}" })
		redirect_to root_path(acess_token: params[:acess_token])
	end

	def create_appointment
		@appointment = HTTParty.post("http://localhost:3000/appointments", body: {appointment: {patient_id: params[:patient_id], doctor_id: params[:doctor_id], diseases: params[:diseases]}}, :headers => {Authorization: "Token token = #{params[:acess_token]}" }) 
		# binding.pry
		redirect_to root_path(acess_token: params[:acess_token])
	end

	def show_appointments
		@appointment = HTTParty.get("http://localhost:3000/appointments", :headers => {Authorization: "Token token = #{params[:acess_token]}}" })		
	end

	private
	def check_acess_token
		user = HTTParty.get("http://localhost:3000/users", body: {acess_token: params[:acess_token]})
		# binding.pry
		@user = JSON.parse(user.body)

		if @user["success"] == false
			redirect_to sessions_sign_in_path, notice: 'Please Sign in'
		end
	end
end