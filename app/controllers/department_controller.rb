class DepartmentController < ApplicationController
  def list
    @departments = Department.includes(:service_points)
                             .order(:name)
  end

  def employees
    @employees = Employee.includes(:departments)
                         .where(
                           status: 'enabled',
                           departments: { id: params[:id] }
                         )
                         .order(:last_name, :first_name)
  end

  def details
    @department = Department.includes(:service_points).find(params[:id])
  end
end
