class MessagesController < ApplicationController

  def top
  end

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
  end

  # def new
  #   @message = Message.new
  # end

  def create
    @message = Message.new(message_params)
    if @message.save
      render :index
    else
      render :new, alert: "本文がありません"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
