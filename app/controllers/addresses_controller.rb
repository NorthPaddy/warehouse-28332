class AddressesController < ApplicationController
  def new
    @address = Address.new
  end

  def create
    @address = Address.new(address_pramas)
    if address.save
      redirect_to root_path(@plate.user_id)
    else
      render :new
    end
  end

  private

  def plate_params
    params.require(:plate).permit(:warehouse_number,:warehouse_colum,:houes_number,:number_of_stage,).merge(user_id: current_user.id)
  end
end
