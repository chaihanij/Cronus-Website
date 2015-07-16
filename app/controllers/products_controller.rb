class ProductsController < ApplicationController
  helper_method :sort_column, :sort_direction

  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    authorize! :manage, @packages , :message => "Access denied."
    if params[:sort] == nil then
        @products = Product.search(params[:search]).order(:created_at => :desc).page(params[:page]).per(50)
    else
        @products = Product.search(params[:search]).order(sort_column + " " + sort_direction).order(:created_at => :desc).page(params[:page]).per(50)
    end
  end

  # GET /products/1
  # GET /products/1.json
  def show
    @package_in_product = @product.packages.where(:is_public => 1).order(:release_date => :desc)
    @lastest_package_release = @product.lastest_package_release
  end

  # GET /products/new
  def new
    authorize! :manage, @product , :message => "Access denied."
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
    authorize! :manage, @product , :message => "Access denied."
  end

  # POST /products
  # POST /products.json
  def create
    authorize! :manage, @product , :message => "Access denied."
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    authorize! :manage, @product , :message => "Access denied."
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    authorize! :manage, @product , :message => "Access denied."
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.friendly.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :description, :public)
    end

    def sort_column
      Product.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end
