class TeamsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :authorize

  def index
    @teams = policy_scope(Team)
    @lc = LinkedConnection.where(user_id: current_user)
    LinkedConnection.find(@lc[0].team_id)
  end

#       # @teams = policy_scope(Team)
#     #all_connections = policy_scope(LinkedConnection)
#     @all_connections = LinkedConnection.where(user_id: current_user)
#       Team.find(@all_connections[0].team_id)
#   # .where(user_id: current_user)
# # (run_id: params[:id])
# # all_buds = policy_scope(BuddyConnection)
# #     @buddies = all_buds.where(user_1_id: current_user) + all_buds.where(user_2_id: current_user)

  def show
    @team = Team.find(@team.user_id)
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
