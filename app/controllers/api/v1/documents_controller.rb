module Api
    module V1
        class DocumentsController < ApplicationController
            skip_before_filter :verify_authenticity_token
            include ApiHelper
            respond_to :json
           
            # GET /documents
            # GET /documents.json
            def index
                respond_with Document.all
            end
            # GET /documents/1
            # GET /documents/1.json
            def show
                respond_with Document.find(params[:id])
            end
             
            # POST /documents
            # POST /documents.json
            def create

                @document = Document.new(document_params)           
                if @document.save
                    respond_with @document.to_json
                else  
                    respond_with @document.errors.to_json, status: :unprocessable_entity 
                end
            end
            # PATCH/PUT /documents/1
            # PATCH/PUT /documents/1.json
            def update
                respond_with Document.find(params[:id]).update_attributes(params[:document])
            end
            # DELETE /documents/1
            # DELETE /documents/1.json
            def destroy
                respond_with Document.destroy(params[:id])
            end
            
            private
             
            def document_params
                params.require(:document).permit(:name, :description, :document, :is_public, :product_id)
            end

        end
    end
end