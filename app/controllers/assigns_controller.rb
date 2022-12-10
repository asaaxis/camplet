class AssignsController < ApplicationController

  def create
    team = find_team(params[:team_id])
    user = email_reliable?(assign_params)? User.find_by(email: assign_params) : nil
    if user
      team.invite_member(user)
      redirect_to team_url(team), notice: "招待に成功しました."
    else
      redirect_to edit_team_path(team), notice: "招待に失敗しました."
    end
  end

  def destroy
    assign = find_user(params[:id])
    assign.destroy
    redirect_to user_path(current_user.id), notice: "チームから退出しました."
  end

  private

  def assign_params
    params[:post][:email]
  end

  def email_reliable?(email)
    email.match(/\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i)
  end

  def find_team(team_id)
    Team.find(params[:team_id])
  end

  def find_user(*)
    Assign.find_by(team_id: params[:id], user_id: current_user)
  end
end
