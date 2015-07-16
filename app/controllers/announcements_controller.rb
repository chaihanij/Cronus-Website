class AnnouncementsController < ApplicationController
  helper_method :sort_column, :sort_direction
  before_action :set_announcement, only: [:show, :edit, :update, :destroy]

  # GET /announcements
  # GET /announcements.json
  def index
    authorize! :manage, @announcements , :message => "Access denied."
    if params[:sort] == nil then
      @announcements = Announcement.search(params[:search]).new_create.page(params[:page]).per(50)
    else
      @announcements = Announcement.search(params[:search]).order(sort_column + " " + sort_direction).page(params[:page]).per(50)
    end

  end

  # GET /announcements/1
  # GET /announcements/1.json
  def show
  end

  # GET /announcements/new
  def new
    authorize! :manage, @announcements , :message => "Access denied."
    @announcement = Announcement.new
  end

  # GET /announcements/1/edit
  def edit
    authorize! :manage, @announcements , :message => "Access denied."
  end

  # POST /announcements
  # POST /announcements.json
  def create
    authorize! :manage, @announcements , :message => "Access denied."
    @announcement = Announcement.new(announcement_params)

    respond_to do |format|
      if @announcement.save
        format.html { redirect_to @announcement, notice: 'Announcement was successfully created.' }
        format.json { render :show, status: :created, location: @announcement }
      else
        format.html { render :new }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /announcements/1
  # PATCH/PUT /announcements/1.json
  def update
    authorize! :manage, @announcements , :message => "Access denied."
    respond_to do |format|
      if @announcement.update(announcement_params)
        format.html { redirect_to @announcement, notice: 'Announcement was successfully updated.' }
        format.json { render :show, status: :ok, location: @announcement }
      else
        format.html { render :edit }
        format.json { render json: @announcement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /announcements/1
  # DELETE /announcements/1.json
  def destroy
    authorize! :manage, @announcements , :message => "Access denied."
    @announcement.destroy
    respond_to do |format|
      format.html { redirect_to announcements_url, notice: 'Announcement was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_announcement
      @announcement = Announcement.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def announcement_params
      params.require(:announcement).permit(:title, :description, :body, :image, :email, :is_public)
    end

    def sort_column
      Announcement.column_names.include?(params[:sort]) ? params[:sort] : "id"
    end
  
    def sort_direction
      %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
    end
end