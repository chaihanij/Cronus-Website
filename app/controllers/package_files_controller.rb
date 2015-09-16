class PackageFilesController < ApplicationController
  
  helper_method :sort_column, :sort_direction

  before_action :set_product
  before_action :set_version
  before_action :set_package_file, only: [:show, :edit, :update, :destroy]

  # GET /package_files
  # GET /package_files.json
  def index
    @package_files = @version.package_files.all
  end

  # GET /package_files/1
  # GET /package_files/1.json
  def show
  end

  # GET /package_files/new
  def new
    @versions = @product.versions
    @package_file = @version.package_files.new
    @package_file.product_id=@product.id
    @package_file.version_id=@version.id
    if params[:product_id] then
      @package_file.product_id=params[:product_id]
    end
    if params[:version_id] then
      @package_file.version_id=params[:version_id]
    end 
  end

  # GET /package_files/1/edit
  def edit
  end

  # POST /package_files
  # POST /package_files.json
  def create
    @package_file = @version.package_files.new(package_file_params)

    respond_to do |format|
      if @package_file.save
        format.html { redirect_to [@package_file.version.product, @package_file.version, @package_file], notice: 'Package file was successfully created.' }
        format.json { render :show, status: :created, location: @package_file }
      else
        format.html { render :new }
        format.json { render json: @package_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /package_files/1
  # PATCH/PUT /package_files/1.json
  def update
    respond_to do |format|
      if @package_file.update(package_file_params)
        format.html { redirect_to [@package_file.version.product, @package_file.version, @package_file], notice: 'Package file was successfully updated.' }
        format.json { render :show, status: :ok, location: @package_file }
      else
        format.html { render :edit }
        format.json { render json: @package_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /package_files/1
  # DELETE /package_files/1.json
  def destroy
    @package_file.destroy
    respond_to do |format|
      format.html { redirect_to product_version_package_files_path(@package_file.version.product, @package_file.version), notice: 'Package file was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package_file
      @package_file = @version.package_files.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_file_params
      params.require(:package_file).permit(:package,
                                           :build_date,
                                           :release_date,
                                           :version_id,
                                           :operating_system_id,
                                           :is_public,
                                           :product_id,
                                           :checksum,
                                           :emergency_package,
                                           :description)
    end

    # Get Product that has the Product
    def set_product
      @product = Product.friendly.find(params[:product_id])
    end

    def set_version
      @version = @product.versions.friendly.find(params[:version_id])
    end

    # Sort
    def sort_column
      Package.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
