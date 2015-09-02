class VersionsController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  before_action :set_product
  before_action :set_version, only: [:show, :edit, :update, :destroy]

  # GET /versions
  # GET /versions.json
  def index
    # @versions = @product.versions.all
    if params[:sort] == nil then
      @versions = @product
                  .versions
                  .search(params[:search])
                  .page(params[:page])
                  .per(25)
    else
      @versions = @product
                  .versions
                  .order(sort_column + " " + sort_direction)
                  .search(params[:search])
                  .page(params[:page])
                  .per(25)
    end
  end

  # GET /versions/1
  # GET /versions/1.json
  def show
  end

  # GET /versions/new
  def new
    @version = @product.versions.new
  end

  # GET /versions/1/edit
  def edit
  end

  # POST /versions
  # POST /versions.json
  def create
    @version = @product.versions.new(version_params)
    if !@version.latest
      logger.debug " ======  version latest  #{@version.latest}"
      @product.versions.set_latest_all_false
    end
    respond_to do |format|
      if @version.save
        format.html { redirect_to [@version.product, @version], notice: 'Version was successfully created.' }
        format.json { render :show, status: :created, location: @version }
      else
        format.html { render :new }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /versions/1
  # PATCH/PUT /versions/1.json
  def update
    if !@version.latest 
      logger.debug "========= version latest  #{@version.latest}"
      @product.versions.set_latest_all_false
    end
    respond_to do |format|
      if @version.update(version_params)
        format.html { redirect_to [@version.product, @version], notice: 'Version was successfully updated.' }
        format.json { render :show, status: :ok, location: @version }
      else
        format.html { render :edit }
        format.json { render json: @version.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /versions/1
  # DELETE /versions/1.json
  def destroy
    @version.destroy
    respond_to do |format|
      format.html { redirect_to product_version_url , notice: 'Version was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # GET /version/1/download
  # GET /version/1/download.json
  def download
      @product = Product.friendly.find(params[:product_id])
      @version = @product.versions.friendly.find(params[:version_id])
  end

  private
    
    # Use callbacks to share common setup or constraints between actions.
    def set_version
      @version = @product.versions.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def version_params
      params.require(:version).permit(:name,
                                      :description,
                                      :is_public,
                                      :product_id,
                                      :latest,
                                      :release_note,
                                      :release_version,
                                      :emergency_version,
                                      :broken_version)
    end

    # Get Product that has the Product
    def set_product
      @product = Product.friendly.find(params[:product_id])
    end

    def sort_column
      Version.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
