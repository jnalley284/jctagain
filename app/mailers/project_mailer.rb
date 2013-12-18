class ProjectMailer < ActionMailer::Base
  default from: "service@justcalltony.com"

  def account_creation(project)
    @project = project
    mail(to: project.user.email, subject: 'Your Order From Just Call Tony')
  end

  def flex_update(status)
    @project = status.project
    @status = status
    @user = @project.user
    mail(to: @user.email, subject: "Status update from Just Call Tony")
  end

end
