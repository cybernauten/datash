class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  include Pundit
  
  def index
  end

  def show
  end

  def update
  end

  def edit
  end

  def update
  end

private

  def user_params
  end
end
