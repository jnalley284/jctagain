class AccountWorker
  include Sidekiq::Worker

  def perform(project_id)
    FlexIntegration.new(project_id)  
  end
end
