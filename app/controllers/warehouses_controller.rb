class WarehousesController < ApplicationController

  def index
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      redirect_to root_path(@warehouse.user_id)
    else
      render :new
    end
  end

  private

  def warehouse_params
    params.require(:warehouse).permit(:warehouse_number, :warehouse_colum, :house_number, :number_of_stage).merge(user_id: current_user.id)
  end
end
