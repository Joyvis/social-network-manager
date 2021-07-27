# frozen_string_literal: true

module Posts
  class TwitterUpdate
    attr_reader :posts

    def self.call(posts:)
      new(posts: posts).call
    end

    def initialize(posts:)
      @posts = posts
    end

    def call
      if posts[:error]
        raise Exception.new('Facebook API is not working')
      else
        update_posts(posts[:content])
      end
    end

    private

    def update_posts(posts)
      TwitterPost.new(posts: posts).save
    end
  end
end
