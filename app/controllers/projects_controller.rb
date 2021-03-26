class ProjectsController < ApplicationController
  #skip_before_action :authenticate_user!, only: [:index, :show]
  #before_action :authorize
  before_action :authenticate_user!

  def index
    @user = current_user
    @projects = policy_scope(Project)
  end

  def show
    @user = current_user
    @project = Project.find(params[:id])
  end

  def edit
    # change something (most likely a file) in this project where I am assigned to
  end

  def update
  # change something (most likely a file) in this project where I am assigned to
    @project = Project.find(params[:id])
    params[:project][:user_ids].try(:delete_if, &:blank?).each do |id|
    @assignments = []
    if Assignment.where(project_id: @project.id, user_id: id).exists?
      @assignments << Assignment.where(project_id: @project.id, user_id: id)
        @assignments.each do |assignment|
          assignment.each do |as|
            as.destroy
          end
      end
    else
      @assignments << Assignment.new(project_id: @project.id, user_id: id)
        @assignments.each do |assignment|
          assignment.save!
      end
    end
  end
    @project.update(project_params)
    redirect_to "/users/#{current_user.id}/projects/#{@project.id}", :notice => "Project members successfully changed"
  end

  def new
    #create a new project for the team
    @user = current_user
    @teams = @user.teams
    @project = Project.new
    @assignment = Assignment.new
  end

  def create
    #create a new project for the team
    @user = current_user
    @project = Project.new(project_params)
    if @project.save!
      current_user.assignments.create(project_id: @project.id)
      redirect_to "/users/#{current_user.id}/projects/#{@project.id}", :notice => "New Project was created"
    else
    # no need for app/views/restaurants/create.html.erb
      redirect_to "/users/#{current_user.id}/projects", :notice => "An Error occured, please try again"
    end
  end

  def destroy
    #destroy a project from team (and all its files???)
    #question: who should be able to delete a whole project
    @user = current_user
    authorize @user
    @project = Project.find(params[:id])
    @team = Team.find(@project.team_id)
    if @project.destroy
      redirect_to "/users/#{current_user.id}/teams/#{@team.id}/projects", :notice => "Project successfully deleted from #{@team.team_name}"
    else
      redirect_to "/users/#{current_user.id}/teams/#{@team.id}/projects", :notice => "Project could not be deleted, please try again"
    end
  end

  private

  def project_params
    params.require(:project).permit(:team_id, :project_name, :description)
  end
end
