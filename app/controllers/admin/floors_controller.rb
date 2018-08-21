class Admin::FloorsController < AdminController
  # before_actions
  before_action :set_floor, only: %i[show edit update destroy]

  # GET admin/floors
  # GET admin/floors.json
  def index
    @floors = Floor.order(:name)
  end

  # GET /floors/1
  # GET /floors/1.json
  def show; end

  # GET /floors/new
  def new
    @floor = Floor.new
  end

  # GET /floors/1/edit
  def edit; end

  # POST /floors
  # POST /floors.json
  def create
    @floor = Floor.new(floor_params)
    respond_to do |format|
      if @floor.save
        format.html { redirect_to admin_floor_path(@floor), success: I18n.t('floor.success') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /floors/1
  # PATCH/PUT /floors/1.json
  def update
    respond_to do |format|
      if @floor.update(floor_params)
        format.html { redirect_to admin_floor_path(@floor), success: I18n.t('floor.edited') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /floors/1
  # DELETE /floors/1.json
  def destroy
    @floor.destroy
    respond_to do |format|
      format.html { redirect_to '/admin/floors', success: I18n.t('floor.deleted') }
    end
  end

  # Private Methods
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_floor
    @floor = Floor.find(params[:id])
  end

  def floor_params
    params.require(:floor)
    .permit(  
              :name,
              :building_id,
              :image,
              :image_cache
    )
  end
end
