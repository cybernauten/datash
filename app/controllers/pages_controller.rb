class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :recent]
  #before_action :authenticate_user!

  def home
  end

  def recent
    if params[:search].present?
      sql_query1 = "projects.project_name ILIKE :query \
        OR projects.description ILIKE :query \
      "
      @projects = Project.where(sql_query1, query: "%#{params[:search][:query]}%")
      sql_query2 = "teams.team_name ILIKE :query \
        OR teams.description ILIKE :query \
      "
      @teams = Team.where(sql_query2, query: "%#{params[:search][:query]}%")
      sql_query3 = "documents.file_name ILIKE :query \
        OR documents.file_type ILIKE :query \
      "
      @documents = Document.where(sql_query3, query: "%#{params[:search][:query]}%")
    end
  end
end
