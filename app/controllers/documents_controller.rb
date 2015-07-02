class DocumentsController < ApplicationController
  before_action :set_document, only: [:show, :edit, :update, :destroy]

  # GET /documents
  # GET /documents.json
  def index
    # authorize! :manage, @documents , :message => "Access denied."
    @documents = Document.all
    @document = Document.new
  end

  # GET /documents/1
  # GET /documents/1.json
  def show
  end

  # GET /documents/new
  def new
    # authorize! :manage, @documents , :message => "Access denied."
    @document = Document.new
  end

  # GET /documents/1/edit
  def edit
    # authorize! :manage, @documents , :message => "Access denied."
  end

  # POST /documents
  # POST /documents.json
  def create
    # authorize! :manage, @documents , :message => "Access denied."
    @document = Document.new(document_params)
    
    respond_to do |format|
      if @document.save
        format.html { redirect_to @document, notice: 'Document was successfully created.' }
        format.json { render :show, status: :created, location: @document }
        format.js   { render action: 'show', status: :created, location: @document }
      else
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
        format.js   { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /documents/1
  # PATCH/PUT /documents/1.json
  def update
    # authorize! :manage, @documents , :message => "Access denied."
    respond_to do |format|
      if @document.update(document_params)
        format.html { redirect_to @document, notice: 'Document was successfully updated.' }
        format.json { render :show, status: :ok, location: @document }
        format.js   { render action: 'show', status: :created, location: @document }
      else
        format.html { render :edit }
        format.json { render json: @document.errors, status: :unprocessable_entity }
        format.js   { render json: @document.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.json
  def destroy
    authorize! :manage, @document , :message => "Access denied."
    @document.destroy
    respond_to do |format|
      format.html { redirect_to documents_url, notice: 'Document was successfully destroyed.' }
      format.json { head :no_content }
    end
  end
  
  def create_multiple

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_document
      @document = Document.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def document_params
      params.require(:document).permit(:documnet)
    end
end
