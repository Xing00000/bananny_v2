class OnSideNanniesController < ApplicationController
	before_action :authenticate_user!


	def new
		@nanny = current_user.nanny
		@preferences = @nanny.preferences.new
		7.times do |w|
			unless @nanny.schedule_settings.find_by(:week => w)
				@nanny.schedule_settings.create!(:week => w)
			end
		end

	end


end
