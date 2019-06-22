class AbandonedCartWorker
  include Sidekiq::Worker if defined?(Sidekiq)

  def perform
    AbandonedCartService.perform
  end

end
