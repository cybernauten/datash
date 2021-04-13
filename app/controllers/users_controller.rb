class UsersController < ApplicationController
  #skip_before_action :authenticate_user!, only: %i[index show]
  before_action :authenticate_user!

  def index
    @users = policy_scope(User)
  end

  def show
    @user = User.find(params[:id])
    @linked_connection = LinkedConnection.where(team_id: params[:id])
    @assignment = Assignment.where(project_id: params[:id])
  end

  def edit
    @user = current_user
    #authorize @user
  end

  def update
    @user = current_user
    #authorize @user
    if @user.update(user_params)
      redirect_to "/users/#{current_user.id}/recent", :notice => "Profile updated"
    else
      render :edit
    end
  end

private

  def user_params
    params.require(:user).permit(:user_name, :email, :password, :avatar_url, :photo)
  end
end
