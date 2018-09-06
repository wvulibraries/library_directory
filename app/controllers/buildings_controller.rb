class BuildingsController < ApplicationController
  def list
    @buildings = Building.where(status: 'enabled').order(:name)
  end

  def employees
    @employees = Employee.joins(:departments).includes(:departments, :phones).where(status: 'enabled', departments: { building_id: params[:id] }).order(:last_name, :first_name)
    @building = Building.find(params[:id])
  end

  def details 
    @building = Building.find(params[:id])
  end 
end
