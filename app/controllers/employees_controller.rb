class EmployeesController < ApplicationController
  def list
    @employees = Employee.includes(:phones, :departments, :departmentable, :addresses, :websites)
                         .where(status: 'enabled')
                         .order(:last_name, :first_name)
  end

  def profile
    @employee = Employee.includes(:phones, :departments, :departmentable, :addresses, :subjects, :websites)
                        .where(id: params[:id], status: 'enabled')
                        .order(:last_name, :first_name)
                        .first
  end
end
