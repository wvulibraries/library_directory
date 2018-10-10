class PhoneListController < ApplicationController
  def morgantown
    building_ids = [9,10,11,13,12]
    @buildings = Building.enabled.order_name.includes(departments: { service_points: [:phones], employees: [:phones] }).order_name
                         .where(id: building_ids)
                         .order(:name)
  end 
end