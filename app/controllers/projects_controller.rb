class ProjectsController < ApplicationController
  before_action :authenticate_user!

  skip_forgery_protection

  def index
    @projects = Project.all
  end

  def show
    @project = Project.find(params[:id])
  end

  def update
    @project = Project.find(params[:id])

    if @project.update(project_params)
      log_status_update
      render json: @project, status: :ok
    else
      render json: @project.errors, status: :unprocessable_entity
    end
  end

  private

  def project_params
    params.require(:project).permit(:status)
  end

  def log_status_update
    Comment.create(
      user: current_user,
      project: @project,
      description: "Project status updated to #{project_params[:status].humanize}"
    )
  end
end
