class Api::UsersController < Api::BaseApiController

  def index
    render  json: User.all,
            each_serializer: UserShortSerializer
  end

  def show
    user = User.find(params[:id])
    render json: user
  end
end
