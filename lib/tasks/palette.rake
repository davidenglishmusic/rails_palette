require 'palette_colours_bot'

namespace :palette do
  task reply_to_tweets: :environment do
    latest_tweet_id = Tweet.last ? Tweet.last.since_id_reply : nil

    File.open(Rails.root.join('palette.yml'), 'w') do |f|
      f << "---\n"
      f << ":consumer_key: #{ENV['TWITTER_CONSUMER_KEY']}\n"
      f << ":consumer_secret: #{ENV['TWITTER_CONSUMER_SECRET']}\n"
      f << ":access_token: #{ENV['TWITTER_ACCESS_TOKEN']}\n"
      f << ":access_token_secret: #{ENV['TWITTER_ACCESS_TOKEN_SECRET']}\n"
      f << ":since_id_reply: #{latest_tweet_id}\n"
    end

    PaletteColoursBot.new.run
  end
end
