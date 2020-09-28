class HomeController < ApplicationController
  def top
    @users = User.all
    @plate = Plate.all
    @warehouse = Warehouse.all.order(id: 'DESC')
  end
end
