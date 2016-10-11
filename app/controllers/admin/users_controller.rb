class Admin::UsersController < ApplicationController
	def edit
		@nannies = Nanny.includes(:user, :image).all

	end


end
