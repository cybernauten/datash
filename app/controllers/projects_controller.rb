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
    @assignments = []
    params[:project][:user_ids].try(:delete_if, &:blank?).each do |id|
      @assignments << Assignment.new(project_id: @project.id, user_id: id)
    end
      @assignments.each do |assignment|
        assignment.save!
      end
    redirect_to "/users/#{current_user.id}/projects/#{@project.id}", :notice => "New member has been added to project"
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
  end

  private

  def project_params
    params.require(:project).permit(:team_id, :project_name, :description)
  end
end