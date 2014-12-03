class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_action :set_movie, only: [:index, :new, :create, :destroy]
  before_action :authenticate_user!, except: [:index]

  def edit
    authorize @comment
  end

  def update
    authorize @comment
    if @comment.update comment_params
      redirect_to movie_path(@comment.movie)
    else
      render action: 'edit'
    end
  end

  def create
    @comment = @movie.comments.build comment_params
    @comment.user = current_user

    authorize @comment

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @movie, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_comment
    @comment = Comment.find(params[:id])
  end

  def set_movie
    @movie = Movie.find(params[:movie_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:body)
  end

end
