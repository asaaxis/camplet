class TravelPlansController < ApplicationController
  before_action :set_travel_plan, only: [:show, :edit, :update, :destroy]

  def index
    @travel_plans = TravelPlan.all
  end

  def show
  end

  def new
    @travel_plan = TravelPlan.new
  end

  def edit
  end

  def create
    @travel_plan = TravelPlan.new(travel_plan_params)

    if @travel_plan.save
      redirect_to @travel_plan, notice: 'Travel plan was successfully created.'
    else
      render :new
    end
  end

  def update
    if @travel_plan.update(travel_plan_params)
      redirect_to @travel_plan, notice: 'Travel plan was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @travel_plan.destroy
    redirect_to travel_plans_url, notice: 'Travel plan was successfully destroyed.'
  end

  private
    def set_travel_plan
      @travel_plan = TravelPlan.find(params[:id])
    end

    def travel_plan_params
      params.require(:travel_plan).permit(:name, :start_schedule_at, :end_schedule_at, :team_id)
    end
end
