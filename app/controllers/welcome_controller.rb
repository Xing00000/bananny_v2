class WelcomeController < ApplicationController
	def index
		if current_user && current_user.nanny
			redirect_to new_in_home_nanny_path
		end
	end
end
