class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    #@users = policy_scope(user)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = User.find(params[:id])
    authorize @user
  end

private

  def user_params
    params.require(:user).permit(:display_name, :avatar_url)
  end
end
