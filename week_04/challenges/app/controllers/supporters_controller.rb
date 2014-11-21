class SupportersController < ApplicationController
	def index
	end

	def create
		@challenge = Challenge.find params[:challenge_id]
		@supporter = @challenge.supporters.create(supporter_params)
		if !@supporter.new_record?
			flash.now[:notice] = 'The supported was added!'
			ChallengeMailer.new_support(@challenge, @supporter).deliver
			redirect_to challenge_path(@challenge)
		else
			@challenge.reload
			flash[:error] = 'The email was invalid!'
			render 'challenges/show'
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
