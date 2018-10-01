class ProfileController < ApplicationController
	include Clearance::Controller

	def index
		render template: 'profile/index'
	end

	def show
		@user = User.find(params[:id])
		render '/profile/show'
	end
end

