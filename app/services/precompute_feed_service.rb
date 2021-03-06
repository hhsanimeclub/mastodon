# frozen_string_literal: true

class PrecomputeFeedService < BaseService
  def call(account)
    FeedManager.instance.populate_home(account)
    FeedManager.instance.populate_direct_feed(account)
  ensure
    Redis.current.del("account:#{account.id}:regeneration")
  end
end
