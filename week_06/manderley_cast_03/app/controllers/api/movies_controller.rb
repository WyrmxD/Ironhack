class Api::MoviesController < Api::BaseApiControllerController
  
  def index
  	render json: Movie.all
  end

  def show
  	render json: Movie.find(params[:id]), serializer: ShowMovieSerializer
  end
end
