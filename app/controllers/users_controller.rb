class UsersController < ApplicationController
  def search
    @users = User.where.not(id: current_user.id).where('name LIKE(?)', "%#{params[:name]}%")
    respond_to do |format|
      format.json
    end
  end
end
