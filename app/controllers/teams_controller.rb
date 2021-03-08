class TeamsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @teams = policy_scope(Team)
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @users = User.all
    @user = current_user
    @team = Team.new
    @linked_connection = LinkedConnection.new
    @team.users << User.find(params[:user_id])
  end

  def create
    @user = current_user
    @team = Team.new(team_params)
    @team.users << User.find(params[:user_id])
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
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :description, :avatar_url)
  end
end
