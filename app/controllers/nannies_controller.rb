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
	    respond_to do |format|
	      if @nanny.save(:status => "checking")
	      	@nanny.user.update(user_data)
	      	@nanny.create_image(license_image)

	        format.html { render :new, notice: 'Nanny was successfully created.' }

	      else
	        format.html { render :new }

	      end
	    end
	  end
  end

	def update
	  respond_to do |format|
	      if current_user.nanny.update(nanny_params)
	      	@nanny.user.update(user_data)
	      	@nanny.image.update(license_image)
	        format.html { redirect_to @nanny, notice: '更新成功!' }
	        format.json { render :show, status: :created, location: @nanny }
	      else
	        format.html { render :new }
	        format.json { render json: @nanny.errors, status: :unprocessable_entity }
	      end
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
      															:user_attributes => [:line_id, :phone, :id],
      															:image_attributes => [:image, :id])
    end

    def user_data
    	nanny_params[:user_attributes]
    end

    def license_image
    	nanny_params[:image_attributes]
    end

end
