require 'open-uri'

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
    extension = @document.doc_file_name.split('.')
    send_file Rails.root.join("public/system/documents/docs/000/000/0#{@document.id}/original", @document.doc_file_name),
    :type => "application/#{extension[1]}", :x_sendfile=>true
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
    #@document.save
    uploaded_io = params[:document][:doc]
    File.open(Rails.root.join('public/system/documents/docs/000/000/024/original', uploaded_io.original_filename), 'wb') do |file|
      file.write(uploaded_io.read)
    end
    @document.file_name = uploaded_io.original_filename

    respond_to do |format|
      if @document.save
        format.html { redirect_to "/users/#{current_user.id}/documents/", :notice => "New Document added" }
        format.json { render :show, status: :created, location: @document }
      else
        # :notice => "Document upload failed"
        format.html { render :new }
        format.json { render json: @document.errors, status: :unprocessable_entity }
      end
    end
    # uploaded_file = params[:doc]
    # File.open(Rails.root.join('public', 'uploads', uploaded_file.original_filename), 'wb') do |file|
    #   file.write(uploaded_file.read)
    # end
  end

  # def get_doc
  #   send_file '/path/to.png', :type => 'image/png', :disposition => 'inline', target: '_blank'
  # end
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

  # def set_doc
  #   @document = Document.find(params[:id])
  # end

  def document_params
    params.require(:document).permit(:file_name, :file_type, :creation_date, :update_date, :file_size, :doc, :id, :project_id, :team_id)
  end
end
