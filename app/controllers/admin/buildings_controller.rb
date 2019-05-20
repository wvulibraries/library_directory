# Buildings Controller
# @author David J. Davis
# Sets data for views, sets redirects, sets errors
class Admin::BuildingsController < AdminController
  # before_actions
  before_action :set_building, only: %i[show edit update destroy]

  # GET admin/buildings
  # GET admin/buildings.json
  def index
    @buildings = Building.all.includes(:addresses, :phones, :floors).order(:name)
  end

  # GET /buildings/1
  # GET /buildings/1.json
  def show; end

  # GET /buildings/new
  def new
    @building = Building.new
  end

  # GET /buildings/1/edit
  def edit; end

  # POST /buildings
  # POST /buildings.json
  def create
    @building = Building.new(building_params)
    respond_to do |format|
      if @building.save
        format.html { redirect_to admin_building_path(@building), success: I18n.t('building.success') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /buildings/1
  # PATCH/PUT /buildings/1.json
  def update
    respond_to do |format|
      if @building.update(building_params)
        format.html { redirect_to admin_building_path(@building), success: I18n.t('building.edited') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /buildings/1
  # DELETE /buildings/1.json
  def destroy
    @building.destroy
    respond_to do |format|
      format.html { redirect_to '/admin/buildings', success: I18n.t('building.deleted') }
    end
  end

  # Private Methods
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_building
    @building = Building.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def building_params
    params.require(:building)
          .permit(:name,
                  :map_link,
                  :image,
                  :image_cache,
                  :remove_image,
                  :directions,
                  departments_attributes: %i[id name description _destroy],
                  addresses_attributes: %i[id line1 line2 city state zip _destroy],
                  floors_attributes: %i[id name image image_cache _destroy],
                  phones_attributes: %i[id number_types number _destroy])
  end
end
