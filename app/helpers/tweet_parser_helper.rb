module TweetParserHelper
  def parse_tweet tweet_text
    new_text = parse_links tweet_text

    parse_mentions new_text
  end

  def parse_mentions tweet_text
    pattern = /(?<!\w)@[\w]+/
    matches = tweet_text.scan(pattern)
    new_text = tweet_text.dup

    matches.each { |match|
      mention_user = match.sub('@','')
      new_text.sub!(match, "<a href=\"https://www.twitter.com/#{mention_user}\">#{match}</a>")
    }

    new_text
  end

  def parse_links tweet_text
    pattern = /http\S+\/\/[\S]+/
    matches = tweet_text.scan(pattern)
    new_text = tweet_text.dup

    matches.each { |match|
      new_text.sub!(match, "<a href=\"#{match}\">#{match}</a>")
    }

    new_text
  end
end
