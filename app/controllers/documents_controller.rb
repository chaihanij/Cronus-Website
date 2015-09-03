class DocumentsController < ApplicationController
  
  before_action :set_product
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    authorize! :manage, @documents , :message => "Access denied."
    @documents = @product.documents.search(params[:search]).page(params[:page]).per(25)
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
    @lasted_documents = @product.documents.last_document(@document.id)
  end

  # GET /documents/new
  def new
    authorize! :manage, @document , :message => "Access denied."
    @document =  @product.documents.new
  end

  # GET /documents/1/edit
  def edit
    authorize! :manage, @document , :message => "Access denied."
  end

  # POST /documents
  # POST /documents.json
  def create
    authorize! :manage, @document , :message => "Access denied."
    @document = @product.documents.new(document_params)

    respond_to do |format|
      if @document.save
        format.html { redirect_to [@document.product, @document], notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    authorize! :manage, @document , :message => "Access denied."
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to [@document.product, @document], notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    authorize! :manage, @document , :message => "Access denied."
    @document.destroy
    respond_to do |format|
      format.html { redirect_to prodcut_documents_path(@document.product, @document), notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = @product.documents.find(params[:id]) 
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:name, :description, :document, :parent_id, :lft, :rgt, :depth, :children_count, :is_public, :product_id)
    end

    # Get Product that has the Product
    def set_product
      @product = Product.friendly.find(params[:product_id])
      # logger.debug "product #{@product.id}"
    end
end
