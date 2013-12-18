class StatusesController < ApplicationController
  skip_before_action :verify_authenticity_token
  respond_to :json

  def create
    if status_params
      status = @project.statuses.build(status_params)
      status.save
      ProjectMailer.flex_update(status).deliver
      render nothing: true, status: 200
    else
      render nothing: true, status: 422
    end
  end

  def status_params
    @project ||= Project.where(flex_project_id: params[:pcode]).first
    if params[:pcode] && params[:status] && params[:message] && @project.present?
      closed = params[:status] == 'Project Completed' ? true : false
      @project.update_attribute(:complete, closed)
      {
        flex_project_code: params[:pcode],
        status_code: params[:status],
        message: params[:message]
      }
    end
  end
end
