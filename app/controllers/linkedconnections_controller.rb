class LinkedconnectionsController < ApplicationController
  def index
  end

  def show
  end

  
  def update
  end
  
  def new
    @user = current_user
    @users = User.all
    @linkedConnection = LinkedConnection.new
    @team = Team.find(params[:team_id])
  end
  
  def create
  end

  def destroy
    @user = current_user
    authorize @user
    @team = Team.find(params[:team_id])
    @users = @team.users
  end
end
