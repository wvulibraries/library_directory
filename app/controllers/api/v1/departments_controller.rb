class Api::V1::DepartmentsController < ApplicationController
  include Version1::DepartmentsSerializer
  include Version1::EmployeesSerializer

  def list
    departments = Department.includes(:building, :phones)
                             .order(:name)
    render json: serialize_departments(departments)
  end

  def employees
    employees = Employee.includes(:departments, :departmentable, :addresses, :phones)
                         .where(
                           status: 'enabled',
                           departments: { id: params[:id] }
                         )
                         .order(:last_name, :first_name)
    render json: serialize_employees(employees)
  end

  def details
    department = Department.includes(:service_points,
                                      :phones,
                                      :building,
                                      service_points: [:phones]).find(params[:id] )

    render json: serialize_department(department)
  end
end
