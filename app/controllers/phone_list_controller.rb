class PhoneListController < ApplicationController
  def morgantown
    @filename = 'WVU_PhoneList_Morgantown.pdf'
    @buildings = Building.enabled
                         .morgantown
                         .includes(
                          departments: {
                            service_points: [:phones],
                            employees: [:phones, :departmentable]
                          }).order_name
  end

  def all
    @filename = 'WVU_PhoneList_All_Libraries.pdf'
    @buildings = Building.enabled
                         .includes(
                          departments: {
                            service_points: [:phones],
                            employees: [:phones, :departmentable]
                          }).order_name
  end
end