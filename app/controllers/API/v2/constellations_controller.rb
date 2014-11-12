module API
  module V2
    class API::V2::ConstellationsController < ApplicationController

      respond_to :json

      def index
        @constellations = Constellation.all
        paginate json: @constellations, per_page: 500  
      end

      def show
        @constellation = Constellation.find_by_id(params[:id])
      end


    end
  end
end

