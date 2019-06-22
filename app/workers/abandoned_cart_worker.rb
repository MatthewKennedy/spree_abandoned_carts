class AbandonedCartWorker
  include Sidekiq::Worker if defined?(Sidekiq)
  sidekiq_options queue: 'default'

  def perform
    AbandonedCartService.perform
  end
end
