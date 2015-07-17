class ImageJsonController < ApplicationController
	
	def create

	    @image = Image.new(image_params)	
	    if @image.save
	      	render json: { url: @image.imageFile.url()}, status: 200
	    else
	       	render json:  { :errors => @image.errors.full_messages } , status: 422 
	    end
  	end

  	private
    # Never trust parameters from the scary internet, only allow the white list through.
    def image_params
      params.require(:image).permit(:title, :alt, :imageFile)
    end
end
