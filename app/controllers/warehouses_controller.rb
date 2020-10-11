class WarehousesController < ApplicationController
  before_action :set_plate, only: [:new, :create]

  def index
  end

  def new
    @warehouse = Warehouse.new
  end

  def create
    @warehouse = Warehouse.new(warehouse_params)
    if @warehouse.save
      flash[:notice] = '登録が完了しました'
      redirect_to plates_path(@plate)
    else
      flash[:alert] = '登録に失敗しました'
      render :new
    end
  end

  private

  def set_plate
    @plate = Plate.find(params[:plate_id])
  end

  def warehouse_params
    params.require(:warehouse).permit(:warehouse_number, :warehouse_colum, :house_number, :number_of_stage).merge(user_id: current_user.id, plate_id: @plate.id)
  end
end
