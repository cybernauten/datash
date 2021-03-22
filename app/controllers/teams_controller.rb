class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all
    @user = current_user
    @teams = policy_scope(Team)
    @linked_connection = LinkedConnection.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @user = current_user
    @team = Team.new
    @linked_connection = LinkedConnection.new
  end

  def create
    @team = Team.new(team_params)
    if @team.save!
      current_user.linked_connections.create(team_id: @team.id)
      redirect_to "/users/#{current_user.id}/teams/#{@team.id}", :notice => "New Team was created"
    else
    # no need for app/views/restaurants/create.html.erb
      redirect_to "/users/#{current_user.id}/teams", :notice => "An Error occured, please try again"
    end
  end

  def edit
  end

  def update
    @team = Team.find(params[:id])
    @linked_connection = []
    params[:team][:user_ids].try(:delete_if, &:blank?).each do |id|
      @linked_connection << LinkedConnection.new(team_id: @team.id, user_id: id)
    end
      @linked_connection.each do |linkedconnection|
        linkedconnection.save!
      end
    redirect_to "/users/#{current_user.id}/teams/#{@team.id}", :notice => "New Teammember has been added"
  end

  def destroy
    @user = current_user
    authorize @user
    @team = Team.find(params[:id])
    if @team.destroy
      redirect_to "/users/#{current_user.id}/teams", :notice => "Team successfully deleted"
    else
      redirect_to "/users/#{current_user.id}/teams/#{@team.id}", :notice => "Team could not be deleted, please try again"
    end
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :description, :avatar_url, :user_ids)
  end
end
