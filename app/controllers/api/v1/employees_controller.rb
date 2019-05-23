class Api::V1::EmployeesController < ApplicationController
  # concerns
  include PublishApi
  before_action :public_headers

  # serializers
  include Version1::BuildingsSerializer
  include Version1::EmployeesSerializer

  def list
    employees = Employee.includes(:phones, :departments, :departmentable, :addresses)
                        .where(status: 'enabled')
                        .order(:last_name, :first_name)
    render json: serialize_employees(employees)
  end

  def profile
    employee = Employee.includes(:phones, :departments, :departmentable, :addresses, :subjects)
                       .where(id: params[:id], status: 'enabled')
                       .order(:last_name, :first_name)
                       .first
    render json: serialize_employee(employee)
  end
end
