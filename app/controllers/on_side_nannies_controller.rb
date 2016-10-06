class OnSideNanniesController < ApplicationController
	before_action :authenticate_user!


	def new
		@nanny = current_user.nanny
		@preferences = @nanny.preferences.new
		7.times do |w|
			@nanny.schedule_settings.where(:week => w).first_or_create!
		end

		if @nanny.long_tern
			@nanny.nanny_charges.where(:period => "長期",	:charge_name => "托育費",
																 :charge_unit => "每月").first_or_create!
		end
		if @nanny.short_tern
			@nanny.nanny_charges.where(:period => "短期", :date_type =>"平日",
																 :charge_name => "托育費", :charge_unit => "每小時").first_or_create!
			@nanny.nanny_charges.where(:period => "短期", :date_type =>"假日",
																 :charge_name => "托育費", :charge_unit => "每小時").first_or_create!
			@nanny.nanny_charges.where(:period => "短期", :date_type =>"平日",
																 :charge_name => "托育費", :charge_unit => "每日").first_or_create!
			@nanny.nanny_charges.where(:period => "短期", :date_type =>"假日",
																 :charge_name => "托育費", :charge_unit => "每日").first_or_create!
			@nanny.nanny_charges.where(:period => "短期",
																 :charge_name => "托育費", :charge_unit => "每月").first_or_create!
			@nanny.nanny_charges.where(:period => "短期",
																 :charge_name => "副食品費", :charge_unit => "每天").first_or_create!
			@nanny.nanny_charges.where(:period => "短期",
																 :charge_name => "副食品費", :charge_unit => "每月").first_or_create!
		end
	end


end
