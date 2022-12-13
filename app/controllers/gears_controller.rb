class GearsController < ApplicationController
  before_action :set_gear, only: [:show, :edit, :update, :destroy]
  before_action :set_q, only: [:index, :search]

  def index
    @gears = current_user.gears
  end

  def show
  end

  def new
    @gear = Gear.new
  end

  def edit
  end

  def create
    @gear = current_user.gears.build(gear_params)

    if @gear.save
      redirect_to @gear, notice: 'ギアを登録しました.'
    else
      render :new
    end
  end

  def update
    if @gear.update(gear_params)
      redirect_to @gear, notice: 'ギアを編集しました.'
    else
      render :edit
    end
  end

  def destroy
    @gear.destroy
    redirect_to gears_url, notice: 'ギアを削除しました.'
  end

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = current_user.gears.ransack(params[:q])
  end

  def set_gear
    @gear = Gear.find(params[:id])
  end

  def gear_params
    params.require(:gear).permit(:name, :description, :quantity, :image, :user_id, :image_cache)
  end
end
