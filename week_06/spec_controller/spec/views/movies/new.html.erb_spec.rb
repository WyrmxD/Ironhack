require 'rails_helper'

RSpec.describe "movies/new", :type => :view do
  before(:each) do
    assign(:movie, Movie.new(
      :title => "MyString",
      :synopsis => "MyText",
      :year => 1
    ))
  end

  it "renders new movie form" do
    render

    assert_select "form[action=?][method=?]", movies_path, "post" do

      assert_select "input#movie_title[name=?]", "movie[title]"

      assert_select "textarea#movie_synopsis[name=?]", "movie[synopsis]"

      assert_select "input#movie_year[name=?]", "movie[year]"
    end
  end
end
