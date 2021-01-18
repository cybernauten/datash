class UsersController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]
  def index
  end

  def show
  end

  def update
  end

  def edit
  end
end
