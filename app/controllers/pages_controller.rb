class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :recent]
  #before_action :authenticate_user!

  def home
  end

  def recent
    @user = current_user
    @projects = @user.projects
    @teams = @user.teams
    @documents = @user.documents

    if params[:search].present?
      #@error = "sorry we couldn't find a run with your criteria" if @teams.empty?
      sql_query1 = "projects.project_name ILIKE :query \
        OR projects.description ILIKE :query \
      "
      @searchable_projects = @projects.where(sql_query1, query: "%#{params[:search][:query]}%")
      sql_query2 = "teams.team_name ILIKE :query \
        OR teams.description ILIKE :query \
      "
      @searchable_teams = @teams.where(sql_query2, query: "%#{params[:search][:query]}%")
      sql_query3 = "documents.doc_file_name ILIKE :query \
        OR documents.doc_content_type ILIKE :query \
      "
      @searchable_documents = @documents.where(sql_query3, query: "%#{params[:search][:query]}%")
    end
  end
end
