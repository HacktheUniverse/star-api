module API
  module V2
    class API::V2::StarsController < ApplicationController

      respond_to :json

      def index 
        @stars = Star.all
        paginate json: @stars, per_page: 500  
      end

      def show
        @star = Star.find_by_label(params[:label])
        render :json => @star
      end


    end
  end
end

