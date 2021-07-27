# frozen_string_literal: true

module Posts
  class List
    def self.call
      new.call
    end

    def call
      {
        facebook: facebook_list,
        twitter: twitter_list
      }
    end

    private

    def facebook_list
      FacebookPost.all
    end

    def twitter_list
      TwitterPost.all
    end
  end
end
