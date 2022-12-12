module TravelPlanHelper
  def choose_new_or_edit
    if action_name == 'new'
      team_travel_plans_path
    elsif action_name == 'edit'
      travel_plan_path
    end
  end
end