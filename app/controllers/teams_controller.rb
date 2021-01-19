class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action

  def index
    @teams = policy_scope(Team)
  end

  def show
    @team = Team.find(@team.user_id)
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

  def team_params
    params.require(:team).permit(:team_name, :description, :avatar_url)
end
