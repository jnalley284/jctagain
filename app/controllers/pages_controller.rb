class PagesController < ApplicationController
  before_filter :authenticate_user!, only: :dashboard
  layout 'authenticated', only: :dashboard

  def index
  end

  def dashboard
    redirect_to new_project_path if current_user.projects.empty?
  end

  def pricing
  end

  def contact_us
  end
end
