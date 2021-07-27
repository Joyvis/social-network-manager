# frozen_string_literal: true

class TwitterPost
  attr_reader :posts, :redis

  def initialize(posts:)
    @posts = posts
    @redis = Redis.current
  end

  def save
    redis.del(:twitter_posts)
    redis.set(:twitter_posts, posts)
  end

  def self.all
    JSON.parse(Redis.current.get(:twitter_posts) || [].to_json, symbolize_names: true)
  end
end
