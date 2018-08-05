# Buildings Controller
# @author David J. Davis
# Sets data for views, sets redirects, sets errors
class Admin::BuildingsController < AdminController
  # before_actions
  before_action :set_building, only: %i[show edit update destroy]

  # GET /buildings
  # GET /buildings.json
  def index
    @buildings = building.all.order(:name)
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show; end

  # GET /buildings/new
  def new
    @building = building.new
  end

  # GET /buildings/1/edit
  def edit; end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = building.new(building_params)
    respond_to do |format|
      if @building.save
        format.html { redirect_to @building, success: success_str }
        format.json { render :show, status: :created, location: @building }
      else
        format.html { render :new }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to @building, success: success_str }
        format.json { render :show, status: :ok, location: @building }
      else
        format.html { render :edit }
        format.json { render json: @building.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      success_str = 'building was successfully destroyed.'
      format.html { redirect_to buildings_url, success: success_str }
      format.json { head :no_content }
    end
  end

  # Private Methods
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_building
    @building = building.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def building_params
    params.require(:building).permit(:name, :description)
  end
end
