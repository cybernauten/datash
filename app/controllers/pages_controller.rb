class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :recent]
  #before_action :authenticate_user!

  def home
  end

  def recent
  end
end
