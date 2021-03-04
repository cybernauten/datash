class ProjectsController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :authorize
  before_action :authenticate_user!

  def index
    @user = current_user
    @projects = policy_scope(Project)
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    # change something (most likely a file) in this project where I am assigned to
  end

  def update
    # change something (most likely a file) in this project where I am assigned to
  end

  def new
    #create a new project for the team
    @user = current_user
    @project = Project.new
  end

  def create
    #create a new project for the team
    @user = current_user
    @project = Project.new(project_params)
    #@project.users << @user
    @project.save

    # no need for app/views/restaurants/create.html.erb
    redirect_to @projects
  end

  def destroy
    #destroy a project from team (and all its files???)
    #question: who should be able to delete a whole project
  end

  private

  def project_params
    params.require(:project).permit(:team_name, :project_name, :description, :avatar_url)
  end
end
