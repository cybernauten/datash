class DocumentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @user = current_user
    @documents = policy_scope(Document)
  end

  def new
  end

  def create
  end

  def update
  end

  def edit
  end

  def show
  end

  def destroy
  end

  private

  def document_params
    params.require(:document).permit(:file_name, :file_type, :creation_date, :update_date, :file_size)
  end
end
