class DocumentsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_user!

  def index
    @user = current_user
    @documents = policy_scope(Document)
  end

  def show
    @user = current_user
    @document = Document.find(params[:id])
  end

  def new
    @user = current_user
    @projects = @user.projects
    @document = Document.new
  end

  def create
    @user = current_user
    #authorize @document
    @document = Document.new(document_params.merge(user_id: current_user.id))
    if @document.save
      redirect_to "/users/#{current_user.id}/documents/", :notice => "New Document added"
    else
      # :notice => "Document upload failed"
      render :new
    end
  end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def document_params
    params.require(:document).permit(:file_name, :file_type, :creation_date, :update_date, :file_size, :doc, :id, :project_id, :team_id)
  end
end
