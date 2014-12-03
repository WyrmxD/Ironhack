class PeopleController < ApplicationController
  before_action :set_person, except: [:create, :new, :index]

  def index
    @people = Person.all
  end

  def show
  end

  def new
    @person = Person.new
  end

  def create
    @person = Person.new person_params

    respond_to do |format|
      if @person.save
        format.html { redirect_to @person, notice: 'Person was successfully added.' }
        format.json { render action: 'show', status: :created, location: @person }
      else
        format.html { render action: 'new' }
        format.json { render json: @person.errors, status: :unprocessable_entity }
      end
    end

  end

  def destroy
    @person.destroy
    
    respond_to do |format|
      format.html { redirect_to movie }
      format.json { head :no_content }
    end
  end

  def edit
  end

  def update
  end


    private
  # Use callbacks to share common setup or constraints between actions.
  def set_person
    @person = Person.find(params[:id])
  end
 
  # Never trust parameters from the scary internet, only allow the white list through.
  def person_params
    params.require(:person).permit(:first_name, :last_name)
  end

end
