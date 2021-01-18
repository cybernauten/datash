class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @users = policy_scope(User)
  end

  def show
    @creator = User.find(params[:id])
  end

  def update
  end

  def edit
  end
end
