module Api
    module V1
        class ProductsController < ApplicationController  
            # before_filter :verify_authenticity_token
            before_filter :verify_authenticity_token
            include ApiHelper
            respond_to :json
           
            # GET /documents
            def index
                respond_with Product.all
            end
            # GET /documents/1
            def show
                respond_with Product.find(params[:id])
            end
             
            # POST /documents
            def create
                @document = Product.new(document_params)           
                if @product.save
                    respond_with @document
                end
            end
            # PATCH/PUT /documents/1
            # PATCH/PUT /documents/1.json
            def update
                respond_with Product.find(params[:id]).update_attributes(params[:product])
            end
            # DELETE /documents/1
            # DELETE /documents/1.json
            def destroy
                respond_with Product.destroy(params[:id])
            end

            # GET /products_is_public
            def products_is_public
                respond_with Product.is_public
            end
            
            private
             
            def document_params
                params.require(:product).permit(:name, :description, :public)
            end
        end
    end
end