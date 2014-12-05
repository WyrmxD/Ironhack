class Api::MoviesController < ApplicationController

  def index
    render  json: Movie.all,
            each_serializer: MovieShortSerializer
  end

  def show
    movie = Movie.find params[:id]
    render json: movie
  end
end
