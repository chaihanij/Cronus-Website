class WikisController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  # GET /wikis.json
  def index
    authorize! :manage, @wikis , :message => "Access denied."
    if params[:sort] == nil then
        @wikis = Wiki.searchAll(params[:search]).order_parent.page(params[:page]).per(50)
    else
        @wikis = Wiki.searchAll(params[:search]).order(sort_column + " " + sort_direction).order_parent.page(params[:page]).per(50)
    end 
    # @wikis_json = Wiki.collection_to_json
    # respond_to do |format|
    #   format.html
    #   format.json { render :json => @wikis.to_json }
    # end
  end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
  end

  # GET /wikis/new
  def new
    authorize! :manage, @wiki , :message => "Access denied."
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
    authorize! :manage, @wiki , :message => "Access denied."
  end

  # POST /wikis
  # POST /wikis.json
  def create
    authorize! :manage, @wiki , :message => "Access denied."
    @wiki = Wiki.new(wiki_params)
    
    respond_to do |format|
      if @wiki.save
        format.html { redirect_to @wiki, notice: 'Wiki was successfully created.' }
        format.json { render :show, status: :created, location: @wiki }
      else
        format.html { render :new }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /wikis/1
  # PATCH/PUT /wikis/1.json
  def update
    authorize! :manage, @wiki , :message => "Access denied."
    respond_to do |format|
      if @wiki.update(wiki_params)
        format.html { redirect_to @wiki, notice: 'Wiki was successfully updated.' }
        format.json { render :show, status: :ok, location: @wiki }
      else
        format.html { render :edit }
        format.json { render json: @wiki.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /wikis/1
  # DELETE /wikis/1.json
  def destroy
    authorize! :manage, @wiki , :message => "Access denied."
    @wiki.destroy
    respond_to do |format|
      format.html { redirect_to wikis_url, notice: 'Wiki was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_wiki
      @wiki = Wiki.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def wiki_params
      params.require(:wiki).permit(:title, :description, :body, :sidebody, :parent_id, :lft, :rgt, :depth, :children_count, :is_public)
    end

    def sort_column
      Wiki.column_names.include?(params[:sort]) ? params[:sort] : "parent_id"
    end
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
    end
end
