module SpreeAbandonedCarts
  class Configuration < Spree::Preferences::Configuration
    preference :abandoned_states, :array, default: [:cart, :address, :delivery, :payment, :confirm]
    preference :abandoned_after_minutes, :integer, default: 10.hours / 1.minute
    preference :worker_frequency_minutes, :integer, default: 30.minutes
    preference :only_look_back, :integer, default: 2.days.ago
  end
end
