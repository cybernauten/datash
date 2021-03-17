class AssignmentsController < ApplicationController
    def update
    end
    
    def new
      @user = current_user
      @project = Project.find(params[:project_id])
      @team = Team.find(params[:team_id])
      @assignment = Assignment.new
    end
    
    def create
    end
  end