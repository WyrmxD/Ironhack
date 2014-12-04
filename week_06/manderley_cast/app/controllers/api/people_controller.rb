class Api::PeopleController < Api::BaseApiControllerController

  def index
  	render json: Person.all
  end

  def show
  	render json: Person.find(params[:id]), serializer: ShowPersonSerializer
  end
end
