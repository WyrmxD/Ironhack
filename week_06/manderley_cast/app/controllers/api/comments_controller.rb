class Api::CommentsController < Api::BaseApiControllerController
  
  def index
  	render json: Comment.all
  end

  def show
  	render json: Comment.find(params[:id]), serializer: ShowCommentSerializer, root: 'comments'
  end
end
