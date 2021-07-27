# frozen_string_literal: true

require 'rails_helper'

describe Posts::TwitterUpdate do
  subject { described_class.call(posts: posts) }

  context 'when posts contain errors' do
    let(:posts) do
      {
        error: false,
        content: [
          {
            username: 'Test',
            tweet: 'foo bar'
          }
        ].to_json
      }
    end

    it 'updates posts' do
      expect { subject }.not_to raise_exception
      expect(Redis.current.get(:twitter_posts)).not_to be_nil
    end
  end

  context 'when posts do not contain errors' do
    before { Redis.current.del(:twitter_posts) }
    let(:posts) do
      {
        error: true,
        content: nil
      }
    end


    it 'does not update posts' do
      expect { subject }.to raise_exception(Exception)
      expect(Redis.current.get(:twitter_posts)).to be_nil
    end
  end
end
