class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.where(group_id: @group.id)
  end

  def create
    @message = Message.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      redirect_to group_messages_path, alert: "本文がありません"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(user_id: current_user.id, group_id: params[:group_id])
  end

end
