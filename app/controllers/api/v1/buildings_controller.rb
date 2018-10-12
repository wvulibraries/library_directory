class Api::V1::BuildingsController < ApplicationController
  include Version1::BuildingsSerializer
  include Version1::EmployeesSerializer
  
  def list
    buildings = Building.visible
                        .includes(:phones, :addresses)
                        .order(:name)
    render json: serialize_buildings(buildings)
  end

  def employees
    employees = Employee.includes(:departments, :departmentable, :addresses, :phones)
                        .where(status: 'enabled', departments: { building_id: params[:id] })
                        .order(:last_name, :first_name)
    render json: serialize_employees(employees)
  end

  def details
    building = Building.includes(:phones, :addresses, :floors, :departments)
                        .find(params[:id])
    render json: serialize_building(building)
  end
end
