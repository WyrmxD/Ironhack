require 'rails_helper'

RSpec.describe KissController, :type => :controller do

  describe "GET object" do
    it "returns http success" do
      get :object
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET ajax" do
    it "returns http success" do
      get :ajax
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET echo" do
    it "returns http success" do
      get :echo
      expect(response).to have_http_status(:success)
    end
  end

end
