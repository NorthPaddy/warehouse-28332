class PlatesController < ApplicationController


  def new
    @plate = Plate.new
  end

  def create
    @plate = Plate.new(plate_params)
    if @plate.save
      redirect_to root_path(@plate.user_id)
    else
      render :new
    end
  end
  
  private

  def plate_params
    params.require(:plate).permit(:mold_id,:thickness_id,:hardness_id,:plate_color_id,
      :plate_width_id,:plate_length_id,:number_of_sheets,).merge(user_id: current_user.id)
  end
end
