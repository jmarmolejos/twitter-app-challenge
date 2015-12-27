module TwitterHelper
  def twitter
    twitter ||= Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['CONSUMER_KEY']
      config.consumer_secret = ENV['CONSUMER_SECRET']
      config.access_token = ENV['ACCESS_TOKEN']
      config.access_token_secret = ENV['ACCESS_TOKEN_SECRET']
    end
  end

  def get_timeline(user)
    Rails.cache.fetch("requests/#{user}", expires_in: 15.minutes) do
      twitter.user_timeline(user, {count: 25})
    end
  end
end
