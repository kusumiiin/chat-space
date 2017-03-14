class GroupsController < ApplicationController
  def new
    @group = Group.new
  end
  def create
    @group = Group.create(name: group_params[:name])
  end
  def edit
    @group = Group.find(params[:id])
  end

  private
  def group_params
    params.require(:group).permit(:name)
  end
end