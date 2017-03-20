class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.where(group_id: @group.id)
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      redirect_to group_messages_path, success: "メッセージを送信しました"
    else
      redirect_to group_messages_path, alert: "#{@message.errors.full_messages[0]}"
    end
  end

  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id])
  end

end
