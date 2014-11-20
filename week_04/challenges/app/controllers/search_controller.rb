class SearchController < ApplicationController
  
  def index
  	@challenges = Challenge.all

  	string = params[:string]
  	@challenges_found = Challenge.where("title LIKE '%#{string}%'")
  	render 'challenges/index'
  end
end
