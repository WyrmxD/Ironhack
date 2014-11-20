class SupportersController < ApplicationController
	def index
	end

	def create
		@challenge = Challenge.find params[:challenge_id]
		@supporter = @challenge.supporters.create(supporter_params)
		if !@supporter.new_record?
			flash.now[:notice] = 'The supported was added!'
			render 'challenges/show'
		else
			flash[:error] = 'The email was invalid!'
			redirect_to challenge_path(@challenge)
		end
	end

	def new
	end

	def edit
	end

	def show
	end

	def update
	end

	def destroy
	end

	private
	def supporter_params
		params.require(:supporter).permit(:email)
	end
end
