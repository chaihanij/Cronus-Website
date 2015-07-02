class OperatingSystemsController < ApplicationController
  before_action :set_operating_system, only: [:show, :edit, :update, :destroy]

  # GET /operating_systems
  # GET /operating_systems.json
  def index
    authorize! :manage, @operating_system , :message => "Access denied."
    @operating_systems = OperatingSystem.all
  end

  # GET /operating_systems/1
  # GET /operating_systems/1.json
  def show
  end

  # GET /operating_systems/new
  def new
    authorize! :manage, @operating_system , :message => "Access denied."
    @operating_system = OperatingSystem.new
  end

  # GET /operating_systems/1/edit
  def edit
    authorize! :manage, @operating_system , :message => "Access denied."
  end

  # POST /operating_systems
  # POST /operating_systems.json
  def create
    authorize! :manage, @operating_system , :message => "Access denied."
    @operating_system = OperatingSystem.new(operating_system_params)

    respond_to do |format|
      if @operating_system.save
        format.html { redirect_to @operating_system, notice: 'Operating system was successfully created.' }
        format.json { render :show, status: :created, location: @operating_system }
      else
        format.html { render :new }
        format.json { render json: @operating_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /operating_systems/1
  # PATCH/PUT /operating_systems/1.json
  def update
    authorize! :manage, @operating_system , :message => "Access denied."
    respond_to do |format|
      if @operating_system.update(operating_system_params)
        format.html { redirect_to @operating_system, notice: 'Operating system was successfully updated.' }
        format.json { render :show, status: :ok, location: @operating_system }
      else
        format.html { render :edit }
        format.json { render json: @operating_system.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /operating_systems/1
  # DELETE /operating_systems/1.json
  def destroy
    authorize! :manage, @operating_system , :message => "Access denied."
    @operating_system.destroy
    respond_to do |format|
      format.html { redirect_to operating_systems_url, notice: 'Operating system was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_operating_system
      @operating_system = OperatingSystem.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def operating_system_params
      params.require(:operating_system).permit(:name, :version, :description, :is_public)
    end
end
