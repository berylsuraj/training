class HardWorkerJob
  include Sidekiq::Job

  def perform(count)
    count.times do |i|
      puts "Doing critical work"
    end
   
  end
end
