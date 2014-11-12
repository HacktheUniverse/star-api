module API
  module V2
    class API::V2::ExoplanetsController < ApplicationController

      respond_to :json

      def index 
        @exoplanets = ExoPlanet.all
        paginate json: @exoplanets, per_page: 500  
      end

      def show
        @exoplanet = ExoPlanet.find_by_label(params[:label])
        render :json => @exoplanet
      end


    end
  end
end

