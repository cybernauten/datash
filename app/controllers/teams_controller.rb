class TeamsController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :authorize
  before_action :authenticate_user!

  def index
    @user = current_user
    @teams = policy_scope(Team)
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @user = current_user
    @team = Team.new
    #authorize @team
  end

  def create
    authorize @team
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
