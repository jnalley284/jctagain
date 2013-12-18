class FlexIntegration

  def initialize(project_id)
    @project = Project.find(project_id)
    
    project_service = ProjectService.new
    project_service.create(@project)

    account_service = AccountService.new
    account_service.update_account(@project)

    ProjectMailer.account_creation(@project).deliver
  end
end
