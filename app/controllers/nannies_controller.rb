class NanniesController < ApplicationController
	before_action :authenticate_user!
	before_action :set_nanny, only: [:update]

	def new
		if current_user.nanny.present?
			@nanny = current_user.nanny
			@image = @nanny.image
		else
			@nanny = current_user.build_nanny
			@image = @nanny.build_image
		end
	end

	def create
		if current_user.nanny.present?
			redirect_to root_path , notice: '已註冊保母,請勿重複註冊!'
	  else
	   	@nanny = current_user.build_nanny
	   	@nanny.status = "checking"
	    respond_to do |format|
	      if @nanny.save
	      	current_user.user_type = "nanny"
	      	@nanny.user.update(user_data)
	      	@nanny.create_image(license_image)
	        format.html { redirect_to new_nanny_path, notice: 'Nanny was successfully created.' }
	      else
	        format.html { redirect_to new_nanny_path }

	      end
	    end
	  end
  end

	def update

	  if @nanny.status == "checking"
	    @nanny.update_attributes(nanny_params)
	    redirect_to new_nanny_path, notice: '更新成功!'
	  elsif @nanny.status == "continue"
	  	@nanny.update_attributes(nanny_params)
	  	if @nanny.nanny_type == "到府"
	  		redirect_to new_on_side_nanny_path, notice: '到府保母!'
	  	elsif @nanny.nanny_type == "在宅"
	  		redirect_to new_in_home_nanny_path, notice: '在宅保母!'
	  	end
	  elsif @nanny.status == "pass"
	  	redirect_to nanny
	  else
	  	@nanny.update_attributes(nanny_params)
	    redirect_to new_nanny_path, notice: '狀態錯誤!'
	  end

  end

	private
    # Use callbacks to share common setup or constraints between actions.
    def set_nanny
      @nanny = Nanny.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def nanny_params
      params.require(:nanny).permit(:status,
      															:license_number,
      															:introduction,
      															:since,
      															:care_start_date,
																		:long_tern,
																		:short_tern,
																		:nanny_type,
																		:min_care_hour,
      															{ :qualification_ids => [],
      																:orther_qualification_ids => [],
      																:zipcode_ids => [],
      																:preference_ids => []
      															},
      															:user_attributes => [	:name,
      																									 	:nickname,
      																									 	:birthdate,
      																										:line_id,
      																										:phone,
      																										:id,
      																										:_destroy,
      																										:admin
      																									],
      															:image_attributes => [ :image,
      																										 :id,
      																										 :_destroy
      																									 ],
      															:schedule_settings_attributes => [ :available,
      																																 :start_at,
      																																 :end_at, :id,
      																																 :_destroy
      																															 ],
      															:nanny_charges_attributes => [ :amount,
														      																 :id,
														      																 :_destroy
														      															 ],
      															:in_home_nanny_attributes =>
      																	[ :hope_baby_quantity,
      																		:number_of_baby_care,
      																		:id,
      																		:_destroy,
      																 			:location_attributes  => [  :zipcode_id,
												      																 					:address,
												      																 					:id,
												      																 					:_destroy
												      																 			 ],
      														  	 			:images_attributes => [ :image,
      														  	 															:id,
      														  	 															:_destroy
      														  	 														]
      														  		]
      														  )
    end

    def user_data
    	nanny_params[:user_attributes]
    end

    def license_image
    	nanny_params[:image_attributes]
    end

end




