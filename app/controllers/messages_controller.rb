class MessagesController < ApplicationController

  def index
    @group = Group.find(params[:group_id])
    @message = Message.new
    @messages = Message.where(group_id: @group.id)

    respond_to do |format|
      format.html
      format.json { @messages = @messages.where("id > ?", params[:latest_message_id]) }
    end
  end

  def create
    @message = current_user.messages.build(message_params)
    if @message.save
      respond_to do |format|
        format.html { redirect_to group_messages_path, success: "メッセージを送信しました" }
        format.json { flash.now[:success] = "メッセージを送信しました" }
      end
    else
      respond_to do |format|
        format.html { redirect_to group_messages_path, alert: @message.errors.full_messages[0] }
      end
    end
  end

  private

  def message_params
    params.require(:message).permit(:body, :image).merge(group_id: params[:group_id])
  end

end
