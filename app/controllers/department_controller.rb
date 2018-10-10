class DepartmentController < ApplicationController
  def list
    @departments = Department.includes(:building, :phones)
                             .order(:name)
  end

  def employees
    @department = Department.find(params[:id])
    @employees = Employee.includes(:departments, :departmentable, :addresses, :phones)
                         .where(
                           status: 'enabled',
                           departments: { id: params[:id] }
                         )
                         .order(:last_name, :first_name)
  end

  def details
    @department = Department.includes(:service_points,
                                      :phones,
                                      :building,
                                      service_points: [:phones]).find(params[:id] )
  end
end
