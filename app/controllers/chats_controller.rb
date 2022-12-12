class ChatsController < ApplicationController
  def create
    # Blogをパラメータの値から探し出し,Blogに紐づくcommentsとしてbuildします。
    @travel_plan = TravelPlan.find(params[:travel_plan_id])
    @chat = @travel_plan.chats.build(chat_params)
    @chat.user_id = current_user.id
    # クライアント要求に応じてフォーマットを変更
    respond_to do |format|
      if @chat.save
        # byebug
        format.html { redirect_to travel_plan_path(@travel_plan), notice: '投稿できました！' }
      else
        format.html { redirect_to travel_plan_path(@travel_plan), notice: '投稿できませんでした...' }
      end
    end
  end

  private
  # ストロングパラメーター
  def chat_params
    params.require(:chat).permit(:content, :team_id, :travel_plan_id, :user_id)
  end
end
