class ChatsController < ApplicationController
  before_action :set_travel_plan, only: [:create]

  def create
    @chat = @travel_plan.chats.build(chat_params)
    @chat.user_id = current_user.id
    respond_to do |format|
      if @chat.save
        flash.now[:notice] = '投稿できました！'
        format.js { render :index } 
      else
        format.html { redirect_to travel_plan_path(@travel_plan), notice: '投稿できませんでした...' }
      end
    end
  end

  def edit
    @chat = Chat.find(params[:id])
    respond_to do |format|
      flash.now[:notice] = 'コメントの編集中'
      format.js { render :edit }
    end
  end

  def update
    @chat = Chat.find(params[:id])
    respond_to do |format|
      if @chat.update(chat_params)
        flash.now[:notice] = 'コメントが編集されました'
        format.js { render :index }
      else
        flash.now[:notice] = 'コメントの編集に失敗しました'
        format.js { render :edit }
      end
    end
  end

  def destroy
    @chat = Chat.find(params[:id])
    @chat.destroy
    respond_to do |format|
      flash.now[:notice] = 'コメントが削除されました'
      format.js { render :index }
    end
  end

  private

  def chat_params
    params.require(:chat).permit(:content, :team_id, :travel_plan_id, :user_id)
  end

  def set_travel_plan
    @travel_plan = TravelPlan.find(params[:travel_plan_id])
  end
end
