module Spree
  Order.class_eval do
    scope :abandoned,
      -> { limit_time = Time.current - SpreeAbandonedCarts::Config.abandoned_after_minutes.minutes

           incomplete.
           where('email IS NOT NULL').
           where("#{quoted_table_name}.item_total > 0").
           where("#{quoted_table_name}.updated_at < ?", limit_time).limit(50) }

    scope :abandon_not_notified,
      -> { abandoned.where(abandoned_cart_email_sent_at: nil) }

    def abandoned_cart_actions

      touch(:abandoned_cart_email_sent_at)
    end

    def last_for_user?
      Order.where(email: email).where('id > ?', id).none?
    end
  end
end
