class MessagesController < ApplicationController

  def top
  end

  def index
    @message = Message.new
  end

  def new
    @message = Message.new
  end

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
    params.require(:message).permit(:body).merge(user_id: current_user.id)
  end

end
