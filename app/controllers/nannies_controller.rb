class NanniesController < ApplicationController

	def new
		 @user = current_user
	end
end
