class GroupsController < ApplicationController

  before_action :set_group, only: [:edit, :update]

  def new
    @group = Group.new
    @user = User.where.not(id: current_user[:id])
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, success: "グループの作成が完了しました"
    else
      render :new, alert: "グループの作成に失敗しました"
    end
  end

  def edit
    @user = User.where.not(id: current_user[:id])
  end

  def update
    if @group.update(group_params)
      redirect_to root_path, success: "グループの更新が完了しました"
    else
      render :edit, alert: "グループの更新に失敗しました"
    end
  end


  private

  def group_params
    params.require(:group).permit(:name, user_ids: [], user_id: [])
  end

  def set_group
    @group = Group.find(params[:id])
  end


end
