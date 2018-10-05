# Leadership Controller
# @author David J. Davis
# Sets data for views, sets redirects, sets errors
class Admin::LeadershipController < AdminController
  # before_actions
  before_action :set_departmentable, only: %i[edit update destroy]


  # GET /admin/employees/:employee_id/leadership
  def index
    @departments = Departmentable.where(employee_id: params[:employee_id]).joins(:employee, :department)
    @employee = Employee.includes(:departments).find(params[:employee_id])
  end

  # GET /admin/employees/:employee_id/leadership/:id/edit
  def edit; end

  # PATCH/PUT /departments/1
  # PATCH/PUT /departments/1.json
  def update
    respond_to do |format|
      if @departmentable.update(department_params)
        format.html { redirect_to '/admin/employees', success: I18n.t('leadership.success') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /departments/1
  # DELETE /departments/1.json
  def destroy
    @departmentable.destroy
    respond_to do |format|
      format.html { redirect_to '/admin/employees', success: I18n.t('leadership.deleted') }
    end
  end

  # Private Methods
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_departmentable
    @departmentable = Departmentable.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def department_params
    params.require(:departmentable).permit(:leadership_role)
  end
end
