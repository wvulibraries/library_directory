# Employees Controller
# @author David J. Davis
# Sets data for views, sets redirects, sets errors
class Admin::EmployeesController < AdminController
  # before_actions
  before_action :set_employee, only: %i[show edit update destroy]

  # GET admin/Employees
  # GET admin/Employees.json
  def index
    @employees = Employee.all.order(:last_name)
  end

  # GET /Employees/1
  # GET /Employees/1.json
  def show; end

  # GET /Employees/new
  def new
    @employee = Employee.new
  end

  # GET /Employees/1/edit
  def edit; end

  # POST /Employees
  # POST /Employees.json
  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to admin_employee_path(@employee), success: I18n.t('employee.success') }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /Employees/1
  # PATCH/PUT /Employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to admin_employee_path(@employee), success: I18n.t('employee.edited') }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /Employees/1
  # DELETE /Employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to '/admin/employees', success: I18n.t('employee.deleted') }
    end
  end

  # Private Methods
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_employee
    @employee = Employee.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def employee_params
    params.require(:employee).permit(
      :department, 
      :department_id,
      :prefix,
      :suffix, 
      :first_name, 
      :middle_name, 
      :last_name, 
      :image,
      :image_cache,
      :wvu_username, 
      :email, 
      :job_title, 
      :university_classification, 
      :description,
      :status, 
      :role, 
      addresses_attributes: %i[id line1 line2 city state zip _destroy],
      phones_attributes: %i[id number_types number _destroy]
    )
  end
end