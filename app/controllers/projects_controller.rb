class ProjectsController < ApplicationController
  def index
    #show all projects from current_user he has been assigned to
    users_projects = policy_scope(Assignment)
    @projects = users_projects.where(user.id == current_user.id)
  end

  def show
    #show one project from current_user he has been assigned to
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
end
