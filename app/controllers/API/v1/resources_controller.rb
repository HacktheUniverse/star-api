module API
  module V1
    class API::V1::ResourcesController < ApplicationController
      before_action :set_resource_class
      before_action :set_resource, only: [:show]
      respond_to :json

      def index
        @items = @resource_class.first(1000)
        render :json => {resource: resource, resource =>  @items}
      end

      def show
        render :json => @item
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
