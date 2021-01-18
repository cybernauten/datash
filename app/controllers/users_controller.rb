class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
    @users = policy_scope(User)
  end

  def show
  end

  def edit
    @user = current_user
    authoriez @user
  end

  def update
    #@user = User.find
  end
end
