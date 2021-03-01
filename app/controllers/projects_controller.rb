class ProjectsController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :authorize
  before_action :authenticate_user!

  def index
    @user = current_user
    @projects = policy_scope(Project)
    #  if params[:term].present?
    #    @projects = policy_scope(Project).where(project_name: params[:term])
    #    if @projects.blank?
    #      @error = "sorry no match"
    #    else @projects.blank? == false
    #      puts "okay okay"
    #    end
    #  else
    #    @projects = policy_scope(Project)
    #  end
  end

  def show
    @project = Project.find(@project.user_id)
  end

  def edit
    # change something (most likely a file) in this project where I am assigned to
  end

  def update
    # change something (most likely a file) in this project where I am assigned to
  end

  def new
    #create a new project for the team
  end

  def create
    #create a new project for the team
  end

  def destroy
    #destroy a project from team (and all its files???)
    #question: who should be able to delete a whole project
  end

  private

  def team_params
    params.require(:project).permit(:project_name, :description, :avatar_url)
  end
end
