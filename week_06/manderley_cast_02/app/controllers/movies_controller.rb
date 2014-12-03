class MoviesController < ApplicationController
  before_action :set_movie, only: [:show, :edit, :update, :destroy, :new_cast, :create_cast, :up, :down]


  def up
    vote =  Vote.user(current_user)
                .movie(@movie)
                .find_or_initialize_by({})

    vote.liked

    authorize vote, :save?

    vote.save

    redirect_to movie_path(@movie)
  end

  def down
    vote =  Vote.user(current_user)
                .movie(@movie)
                .find_or_initialize_by({})

    vote.disliked

    authorize vote, :save?

    vote.save

    redirect_to movie_path(@movie)
  end

  # GET /movies
  # GET /movies.json
  def index
    @movies = Movie.all
  end

  # GET /movies/1
  # GET /movies/1.json
  def show
  end

  # GET /movies/new
  def new
    @movie = Movie.new
    authorize @movie
  end

  # GET /movies/1/edit
  def edit
    authorize @movie
  end

  # POST /movies
  # POST /movies.json
  def create
    @movie = Movie.new(movie_params)

    authorize @movie

    respond_to do |format|
      if @movie.save
        format.html { redirect_to @movie, notice: 'Movie was successfully created.' }
        format.json { render action: 'show', status: :created, location: @movie }
      else
        format.html { render action: 'new' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /movies/1
  # PATCH/PUT /movies/1.json
  def update
    authorize @movie

    respond_to do |format|
      if @movie.update(movie_params)
        format.html { redirect_to @movie, notice: 'Movie was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @movie.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /movies/1
  # DELETE /movies/1.json
  def destroy
    authorize @movie
    @movie.destroy
    respond_to do |format|
      format.html { redirect_to movies_url }
      format.json { head :no_content }
      format.js do
        render(
          partial: 'destroy_animation',
          locals: { resource: @movie })
      end
    end
  end

  # GET /movies/1/cast/new
  def new_cast
    @cast = @movie.casts.build
  end

  # POST   /movies/:movie_id/cast
  def create_cast
    @cast = @movie.casts.build(cast_params)
    respond_to do |format|
      if @cast.save
        format.html { redirect_to @movie, notice: "Cast added" }
        format.json { render action: :show, status: :created, location: @movie}
      else
        format.html { render action: :new }
        format.json { render json: @cast.errors, status: :unprocessable_entity}
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movie
      @movie = Movie.find(params[:movie_id] || params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def movie_params
      params.require(:movie).permit(:title, :year, :duration, :synopsis)
    end

    def cast_params
      params.require(:cast).permit(:person_id, :role)
    end
end
