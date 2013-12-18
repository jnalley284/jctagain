class ConfirmAccountWorker
  include Sidekiq::Worker

  def perform(user_id)
    UserMailer.account_confirmed(user_id).deliver  
  end
  
end