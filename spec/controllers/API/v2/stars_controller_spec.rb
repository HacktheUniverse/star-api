require 'rails_helper'

RSpec.describe API::V2::StarsController, :type => :controller do
  
  describe "GET#index" do 

    it "responds successfully with an http 200" do
      get :index
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    # it "renders the response as JSON" do
    #   get :index
    #   expect(response).to render_template("index")
    # end

    it "loads stars into @stars" do
      star1, star2 = Star.create!, Star.create!
      get :index
      expect(assigns(:stars)).to match_array([star1, star2])
    end

    pending "it should load 500 stars into @stars"
    

  end
 

  describe "GET#show" do
    it "responds successfully with an http 200" do
      get '/stars/Sun'
      expect(response).to be_success
      expect(response).to have_http_status(200)
    end

    it "returns a single star" do
      star1, star2 = Star.create!, Star.create!
      get :show/star1.label
      expect(assigns(:star)).to match(star1)
    end
  end

end



