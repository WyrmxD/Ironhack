class ChallengesController < ApplicationController
	def index
		@challenges = Challenge.all
	end

	def new
		@challenge = Challenge.new()
	end

	def create
		@challenge = Challenge.create(challenge_params)

		if @challenge.valid?
			flash[:notice] = 'The challenge was created!'
			redirect_to challenges_path
		else
			flash.now[:error] = 'The challenge is wrong!'
			render 'new'
		end
	end

	def edit
		@challenge = Challenge.find params[:id]
	end

	def show
		@challenge = Challenge.find params[:id]
		@supporter = Supporter.new()
	end

	def update
		@challenge = Challenge.find(params[:id])
		@challenge.update_attributes challenge_params
		render 'show'
	end

	def destroy
		challenge = Challenge.find(params[:id])
		challenge.destroy
		redirect_to challenges_path
	end

	private
	def challenge_params
		params.require(:challenge).permit(:title, :description)
	end
end
