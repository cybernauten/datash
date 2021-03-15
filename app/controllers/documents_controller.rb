class DocumentsController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_user!

  def index
    @user = current_user
    @documents = policy_scope(Document)
  end

  def show
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
    # uploaded_file = params[:doc]
    # File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
    #   file.write(uploaded_file.read)
    # end

  end

  # def upload
  #   #uploaded_file = params[:user][:doc]
  # end

  # def download
  #   upload = Upload.find(params[:id])
  #   send_file upload.uploaded.path,
  #     :file_name => upload.uploaded_file_name,
  #     :file_type => upload.uploaded_content_type,
  #     :disposition => 'attachment'
  #   flash[:notice] = "Your file has been downloaded"
  # end

  def update
  end

  def edit
  end

  def destroy
  end

  private

  def document_params
    params.require(:document).permit(:file_name, :file_type, :creation_date, :update_date, :file_size, :doc, :project_id)
  end
end
