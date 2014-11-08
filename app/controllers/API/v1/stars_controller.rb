module API
  module V1
    class API::V1::StarsController < ApplicationController

      respond_to :json

      def index
        render json: "all these stars are yours"
      end
      
    end
  end
end
