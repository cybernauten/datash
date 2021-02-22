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
    @document = Document.new
  end

  def create
    authorize @document
  end

  def update
  end

  def edit
  end


  def destroy
  end

  private

  def document_params
    params.require(:document).permit(:file_name, :file_type, :creation_date, :update_date, :file_size)
  end
end
