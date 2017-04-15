class UsersController < ApplicationController
  def search
    keyword = params[:keyword]
    @users = User.where.not(id: current_user.id).where('name LIKE(?)', "%#{keyword}%") if keyword.present?
    respond_to do |format|
      format.json
    end
  end
end
