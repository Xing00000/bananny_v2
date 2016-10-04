class NanniesController < ApplicationController
	before_action :authenticate_user!

	def new
		if current_user.nanny.present?
			@nanny = current_user.nanny
		else
			@nanny = current_user.build_nanny
		end
	end

	def create

		if current_user.nanny.present?
			redirect_to root_path , notice: '已註冊保母,請勿重複註冊!'
	  else
	   	@nanny = current_user.build_nanny
	    respond_to do |format|
	      if @nanny.save
	      	@nanny.user.update(user_data)
	        format.html { redirect_to @nanny, notice: 'Nanny was successfully created.' }
	        format.json { render :show, status: :created, location: @nanny }
	      else
	        format.html { render :new }
	        format.json { render json: @nanny.errors, status: :unprocessable_entity }
	      end
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
      params.require(:nanny).permit(:user_attributes => [:line_id, :phone, :id])
    end

    def user_data
    	nanny_params[:user_attributes]
    end



end
