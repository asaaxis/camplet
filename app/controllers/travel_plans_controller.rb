class TravelPlansController < ApplicationController
  before_action :set_travel_plan, only: [:show, :edit, :update, :destroy]
  before_action :set_team, only: [:index, :new, :edit, :create]

  def index
    @travel_plans = Team.find(params[:team_id]).travel_plans
  end

  def show
  end

  def new
    @travel_plan = TravelPlan.new
  end

  def edit
  end

  def create
    # binding.pry
    @travel_plan = TravelPlan.new(travel_plan_params)
    if @travel_plan.save
      redirect_to team_travel_plans_path, notice: 'Travel plan was successfully created.'
    else
      render :new
    end
  end

  def update
    if @travel_plan.update(travel_plan_params)
      redirect_to team_travel_plans_path, notice: 'Travel plan was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @travel_plan.destroy
    redirect_to team_travel_plans_path, notice: 'Travel plan was successfully destroyed.'
  end

  private

  def set_travel_plan
    @travel_plan = TravelPlan.find(params[:id])
  end
  
  def set_team
    @team = Team.find(params[:team_id])
  end

  def travel_plan_params
    params.require(:travel_plan).permit(:name, :start_schedule_at, :end_schedule_at).merge(team_id: params[:team_id])
  end
end
