require 'spec_helper'

describe CommentsController do
  let(:valid_attributes) { FactoryGirl.attributes_for(:comment) }
  let(:valid_session) { {} }

  # describe "GET index" do
  #   it "assigns all comments as @comments" do
  #     comment = FactoryGirl.create :comment
  #     movie = comment.movie
  #     get :index, {movie_id: movie.to_param}, valid_session
  #     expect(assigns(:comments)).to eq([comment])
  #   end
  # end

  # describe "GET show" do
  #   it "assigns comment as @comment" do
  #     comment = FactoryGirl.create :comment
  #     movie = comment.movie
  #     get :show, {movie_id: movie.to_param, id: comment.to_param}, valid_session
  #     expect(assigns(:comment)).to eq(comment)
  #   end
  # end

  # describe "GET new" do
  #   it "assigns a new comment as @comment" do
  #     movie = FactoryGirl.build :movie
  #     get :new, {movie_id: movie.to_param}, valid_session
  #     expect(assigns(:comment)).to be_a_new(Comment)
  #   end

  #   it "assigns movie as the comment's movie" do
  #     comment = FactoryGirl.create :comment
  #     movie = comment.movie
  #     get :new, {movie_id: movie.to_param}, valid_session
  #     expect(assigns(:movie)).to eq(comment.movie)
  #   end
  # end

  # describe "POST create" do
  #   describe "with valid params" do
  #     it "creates a new Comment" do
  #       comment = FactoryGirl.create :comment
  #       movie = comment.movie
  #       expect {
  #         post :create, {movie_id: movie.to_param, comment: valid_attributes}, valid_session
  #       }.to change(Comment, :count).by(1)
  #     end

  #     it "assigns a newly created comment as @comment" do
  #       comment = FactoryGirl.create :comment
  #       movie = comment.movie
  #       post :create, {movie_id: movie.to_param, comment: valid_attributes}, valid_session
  #       expect(assigns(:comment)).to be_a(Comment)
  #       expect(assigns(:comment)).to be_persisted
  #     end

  #     it "redirects to the movie's created comment" do
  #       comment = FactoryGirl.create :comment
  #       movie = comment.movie
  #       post :create, {movie_id: movie.to_param, comment: valid_attributes}, valid_session
  #       expect(response).to redirect_to(movie)
  #     end
  #   end

  #   describe "with invalid params" do
  #     it "assigns a newly created but unsaved comment as @comment" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       movie = FactoryGirl.create :movie
  #       Comment.any_instance.stub(:save).and_return(false)
  #       post :create, {movie_id: movie.to_param, :comment => { body: "hola" }}, valid_session
  #       expect(assigns(:comment)).to be_a_new(Comment)
  #     end

  #     it "re-renders the 'new' template" do
  #       # Trigger the behavior that occurs when invalid params are submitted
  #       movie = FactoryGirl.create :movie
  #       Comment.any_instance.stub(:save).and_return(false)
  #       post :create, {movie_id: movie.to_param, :comment => { body: "hola" }}, valid_session
  #       expect(response).to render_template("new")
  #     end
  #   end
  # end

  # describe "DELETE destroy" do
  #   it "destroys the requested comment" do
  #     comment = FactoryGirl.create :comment
  #     movie = comment.movie
  #     expect {
  #       delete :destroy, {movie_id: movie.to_param, id: comment.to_param}, valid_session
  #     }.to change(Comment, :count).by(-1)
  #   end

  #   it "redirects to the movie" do
  #     comment = FactoryGirl.create :comment
  #     movie = comment.movie
  #     delete :destroy, {movie_id: movie.to_param, id: comment.to_param}, valid_session
  #     expect(response).to redirect_to(movie)
  #   end
  # end

end
