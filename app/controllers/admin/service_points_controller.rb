# Service Points Controller
# @author David J. Davis
# Sets data for views, sets redirects, sets errors
class Admin::ServicePointsController < AdminController

  # before_actions
  before_action :set_service, only: %i[show edit update destroy]

  # GET admin/service_points
  # GET admin/service_points.json
  def index
    @service = ServicePoint.all.includes(:department).order(:name)
  end

  # GET /service_points/1
  # GET /service_points/1.json
  def show; end

  # GET /service_points/new
  def new
    @service = ServicePoint.new
  end

  # GET /service_points/1/edit
  def edit; end

  # POST /service_points
  # POST /service_points.json
  def create
    @service = ServicePoint.new(service_params)
    respond_to do |format|
      if @service.save
        format.html { redirect_to admin_service_point_path(@service), success: I18n.t('service.success') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /service_points/1
  # PATCH/PUT /service_points/1.json
  def update
    respond_to do |format|
      if @service.update(service_params)
        format.html { redirect_to admin_service_point_path(@service), success: I18n.t('service.edited') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /service_points/1
  # DELETE /service_points/1.json
  def destroy
    @service.destroy
    respond_to do |format|
      format.html { redirect_to '/admin/service_points', success: I18n.t('service.deleted') }
    end
  end

  # Private Methods
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_service
    @service = ServicePoint.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def service_params
    params.require(:service_point)
    .permit(  :department,
              :department_id,
              :name,
              phones_attributes: %i[id number_types number _destroy]
            )
  end
end
