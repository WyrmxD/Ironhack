require 'spec_helper'

describe PeopleController do
  let(:valid_attributes) { FactoryGirl.attributes_for(:person) }
  let(:valid_session) { {} }

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Person" do
        movie = FactoryGirl.create :movie
        expect {
          post :create, { movie_id: movie.to_param, person: valid_attributes }, valid_session
          }.to change(Person, :count).by(1)
      end

      it "assigns a newly created person as @person" do
         person = FactoryGirl.create :person
         movie = person.movie
         post :create, { movie_id: movie.to_param, person: valid_attributes }, valid_session
         expect(assigns(:person)).to be_a(Person)
         expect(assigns(:person)).to be_persisted
      end

      it "assigns @movie as the person's movie" do
        person = FactoryGirl.create(:person)
        movie = person.movie
        post :create, { movie_id: movie.to_param, person: valid_attributes }, valid_session
        expect(assigns(:movie)).to eq(person.movie)
      end

      it "redirects to the movie" do
       person = FactoryGirl.create :person
       movie = person.movie
       post :create, {movie_id: movie.to_param, person: valid_attributes}, valid_session
       expect(response).to redirect_to(movie)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved person as @person" do
        movie = FactoryGirl.create :movie
        Person.any_instance.stub(:save).and_return(false)
        post :create, {movie_id: movie.to_param, person: valid_attributes}, valid_session
        expect(assigns(:person)).to be_a_new(Person)
        expect(assigns(:person)).not_to be_persisted
      end

      it "re-renders the 'new' template" do
        movie = FactoryGirl.create :movie
        Person.any_instance.stub(:save).and_return(false)
        post :create, {movie_id: movie.to_param, person: valid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end


  end
end
