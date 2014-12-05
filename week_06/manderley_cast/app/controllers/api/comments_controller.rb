class Api::CommentsController < Api::BaseApiController

  def index
    render  json: Comment.all,
            each_serializer: CommentShortSerializer
  end

  def show
    comment = Comment.find(params[:id])
    render json: comment
  end
end
