class WikisController < ApplicationController
  before_action :set_wiki, only: [:show, :edit, :update, :destroy]

  # GET /wikis
  # GET /wikis.json
  def index
    get_data(Wiki.roots.page(params[:page]).per(10))
    @wikis =  Wiki.roots.page(params[:page]).per(10)
  end

  def get_data(wikis)
    logger.debug "++++++++++++++++++++++++++++++++++++"
    # objcet = new Tree.new()
    for wiki in wikis do

      recursive_data(wiki,0)
    end 
  end 

  def recursive_data(wiki, level)
      str = "-" * level
      # value = new Tree.new(object, wiki.title)
      # object.children[object.children.size] = value
      logger.debug "#{str} recursive_data  #{wiki.title}, #{level}"
      level = level + 1
      i=0
      for x in wiki.children
        str = "-" * level
        recursive_data(x, level)
        i = i + 1
      end 
  end

  # class Tree
  #   attr_accessor :parant, :value, 
  #   def initialize(p,v)
  #     @parant = p
  #     @value = v
  #     @children = []
  #   end
  # end

  # def dup_str(char, level)
  #   output
  #   for x in 0..level
  #     output += char
  #   end
  #   return output
  # end

  # GET /wikis/1
  # GET /wikis/1.json
  def show
  end

  # GET /wikis/new
  def new
    @wiki = Wiki.new
  end

  # GET /wikis/1/edit
  def edit
  end

  # POST /wikis
  # POST /wikis.json
  def create
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
end
