class HardWorkerJob
  include Sidekiq::Job

  def perform(params)
   Students.save!(params)
   
  end
end
