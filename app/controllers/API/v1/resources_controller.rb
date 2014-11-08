module API
  module V1
    class API::V1::ResourcesController < ApplicationController
      before_action :set_resource, only: [:show]
      respond_to :json

      def index
        @items = Rails.cache.read(resource)
        render :json => {resource: resource, resource =>  @items.values }
      end

      def show
        render :json => @item
      end

      private
      def resource
        params[:resource]
      end

      def set_resource
        @item = Rails.cache.read(resource).fetch(params[:id])
      end
    end
  end
end
