# frozen_string_literal: true

class TwitterExternalService
  class << self
    def list_posts
      format_response(content: RestClient.get(ENV['TWITTER_EXTERNAL_SERVICE']).body)
    rescue
      format_response(error: true)
    end

    private

    def format_response(content: nil, error: false)
      {
        content: content,
        error: error
      }
    end
  end
end
