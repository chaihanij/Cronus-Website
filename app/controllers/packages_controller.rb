class PackagesController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_package, only: [:show, :edit, :update, :destroy]

  # GET /packages
  # GET /packages.json
  def index
    authorize! :manage, @packages , :message => "Access denied."
    @packages = Package.order(sort_column + " " + sort_direction).order(:product_id => :asc).search(params[:search]).page(params[:page]).per(50)
  end

  # GET /packages/1
  # GET /packages/1.json
  def show
  end

  # GET /packages/new
  def new
    authorize! :manage, @packages , :message => "Access denied."
    @package = Package.new
  end

  # GET /packages/1/edit
  def edit
    authorize! :manage, @packages , :message => "Access denied."
  end

  # POST /packages
  # POST /packages.json
  def create
    authorize! :manage, @packages , :message => "Access denied."
    @package = Package.new(package_params)

    respond_to do |format|
      if @package.save
        format.html { redirect_to @package, notice: 'Package was successfully created.' }
        format.json { render :show, status: :created, location: @package }
      else
        format.html { render :new }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /packages/1
  # PATCH/PUT /packages/1.json
  def update
    authorize! :manage, @packages , :message => "Access denied."
    respond_to do |format|
      if @package.update(package_params)
        format.html { redirect_to @package, notice: 'Package was successfully updated.' }
        format.json { render :show, status: :ok, location: @package }
      else
        format.html { render :edit }
        format.json { render json: @package.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /packages/1
  # DELETE /packages/1.json
  def destroy
    authorize! :manage, @packages , :message => "Access denied."
    @package.destroy
    respond_to do |format|
      format.html { redirect_to packages_url, notice: 'Package was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_package
      @package = Package.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def package_params
      params.require(:package).permit(:product_id, :operating_system_id, :name, :version, :package, :release_note, :release_package, :emergency_package, :notwork_package, :is_public, :checksum, :release_date, :build_date, :description)
    end

    def sort_column
      Package.column_names.include?(params[:sort]) ? params[:sort] : "name"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
