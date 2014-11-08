module API
  module V1
    class API::V1::ResourcesController < ApplicationController
      before_action :set_resource_class, except: :search
      before_action :set_resource, only: [:show]
      respond_to :json

      def index
        items = @resource_class.all
        paginate json: items, per_page: 50
      end

      def show
        paginate :json => @item, per_page: 50
      end

      def search
        query = params[:q]
        models = [Star, ExoPlanet, LocalGroup, OpenCluster, Constellation]
        search_response = models.map {|m| m.search(query) }
        paginate :json => search_response, per_page: 50  
      end

      private
      def resource
        params[:resource]
      end


      def set_resource
        @item = @resource_class.find_by_label(params[:id])
      end

      def set_resource_class
        @resource_class = resource.classify.constantize
      end
    end
  end
end
