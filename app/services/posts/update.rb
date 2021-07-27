# frozen_string_literal: true

module Posts
  class Update
    attr_reader :facebook_posts, :twitter_posts

    def self.call
      new.call
    end

    def initialize
      @facebook_posts = list_facebook_posts
      @twitter_posts = list_twitter_posts
    end

    def call
      Posts::FacebookUpdate.call(posts: facebook_posts)
      Posts::TwitterUpdate.call(posts: twitter_posts)
      response
    rescue StandardError => e
      response(success: false, message: e.message.to_s)
    end

    private

    def list_facebook_posts
      FacebookExternalService.list_posts
    end

    def list_twitter_posts
      TwitterExternalService.list_posts
    end

    def response(success: true, message: nil)
      OpenStruct.new(success?: success, message: message)
    end
  end
end
