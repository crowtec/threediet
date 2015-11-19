class AdminController < ApplicationController
  layout 'admin'
  before_action :authenticate_user!
  before_action :authenticate_admin
  def index

  end

  private
  def authenticate_admin
    redirect_to root_path unless current_user.is_admin?
  end
end
