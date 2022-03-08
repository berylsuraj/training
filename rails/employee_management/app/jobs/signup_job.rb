class SignupJob < ApplicationJob
  queue_as :default

  def perform(params)
    UserMailer.with(user: params).welcome_email.deliver_now
    # Do something later
  end
end
