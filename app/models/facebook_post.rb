# frozen_string_literal: true

class FacebookPost
  attr_reader :posts, :redis

  def initialize(posts:)
    @posts = posts
    @redis = Redis.current
  end

  def save
    redis.del(:facebook_posts)
    redis.set(:facebook_posts, posts)
  end

  def self.all
    JSON.parse(Redis.current.get(:facebook_posts) || [].to_json, symbolize_names: true)
  end
end
