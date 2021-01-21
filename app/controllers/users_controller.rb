class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    @users = policy_scope(User)
  end

  def show
    @creator = User.find(params[id])
    @linked_connection = LinkedConnection.where(team_id: params[:id])
  end

  def update
    authorize @user
  end

  def edit
    authorize @user
  end

  def update
    authorize @user
  end

private

  def user_params
    params.require(:user).permit(:display_name, :user_name, :email, :password, :avatar_url)
  end
end
