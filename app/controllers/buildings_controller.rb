class BuildingsController < ApplicationController
  def list
    @buildings = Building.includes(:phones, :addresses)
                         .where(status: 'enabled')
                         .order(:name)
  end

  def employees
    @employees = Employee.includes(:departments, :departmentable, :addresses, :phones)
                         .where(status: 'enabled', departments: { building_id: params[:id] })
                         .order(:last_name, :first_name)
    @building = Building.find(params[:id])
  end

  def details
    @building = Building.includes(:phones, :addresses, :floors, :departments)
                        .find(params[:id])
  end
end
