class PlatesController < ApplicationController
  def index
    @plate = Plate.all.order(id: 'DESC')
  end

  def new
    @plate = Plate.new
  end

  def create
    @plate = Plate.new(plate_params)
    if @plate.save
      redirect_to plates_path, notice: 'プレート情報が登録されました'
    else
      render :new
    end
  end

  def edit
    @plate = Plate.find(params[:id])
  end

  def update
    @plate = Plate.find(params[:id])
    if @plate.update(plate_params)
      flash[:notice] = '編集が完了しました'
      redirect_to action: :index
    else
      flash[:alert] = '編集が失敗しました'
      render action: :edit
    end
  end

  def destroy
    plate = Plate.find(params[:id])
    if plate.destroy
      flash[:notice] = '削除が完了しました'
      redirect_to action: :index
    else
      flash[:alert] = '削除が失敗しました'
      render :index
    end
  end

  private

  def plate_params
    params.require(:plate).permit(:mold_id, :thickness_id, :hardness_id, :plate_color_id,
                                  :plate_width_id, :plate_length_id, :number_of_sheets).merge(user_id: current_user.id)
  end
end
