class HomeController < ApplicationController
  def top
    @users = User.all
    @warehouse = Warehouse.all.includes(:plates)
  end
end
