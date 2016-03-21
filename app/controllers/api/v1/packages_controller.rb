module Api
  module V1
    class PackagesController < ApplicationController
      include ApiHelper
      respond_to :json
      def index
		id = params[:prodcut_id]
        
	  end
	end
  end
end
