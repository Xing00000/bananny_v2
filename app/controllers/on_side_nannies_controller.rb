class OnSideNanniesController < ApplicationController
	before_action :authenticate_user!


	def new
		@nanny = current_user.nanny
		@preferences = @nanny.preferences.new
	end


end
