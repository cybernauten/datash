class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
  #  @users = policy_scope(User)
  end

  def show
    @creator = User.find(params[:id])
    @linked_connection = LinkedConnection.where(team_id: params[:id])
    @assignment = Assignment.where(project_id: params[:id])
  end

  def edit
    @user = current_user
    authorize @user
  end

  # def update
  #   authorize @user
  # end

private

  def user_params
    params.require(:user).permit(:display_name, :user_name, :email, :password, :avatar_url)
  end
end
