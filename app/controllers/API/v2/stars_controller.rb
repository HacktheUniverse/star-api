module API
  module V2
    class API::V2::StarsController < ApplicationController

      respond_to :json

      def index
        @stars = Stars.all
        paginate json: @stars, per_page: 500  
      end

      def show
        @star = Stars.find_by_label(params[:label])
        render :json => @star
      end


    end
  end
end

