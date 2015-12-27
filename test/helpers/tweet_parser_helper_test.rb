require 'test_helper'

class TweetParserHelperTest < ActionView::TestCase
  include TweetParserHelper

  test "should replace mention" do
    tweet = "@foo is baz."

    parsed = parse_mentions tweet

    assert_equal('<a href="https://www.twitter.com/foo">@foo</a> is baz.', parsed)
  end

  test "should replace multiple mentions" do
    tweet = "@foo is baz cc:@bar."

    parsed = parse_mentions tweet

    assert_equal('<a href="https://www.twitter.com/foo">@foo</a> is baz cc:<a href="https://www.twitter.com/bar">@bar</a>.', parsed)
  end

  test "email should not be replaced" do
    tweet = "email is john@example.com."

    parsed = parse_mentions tweet

    assert_equal(tweet, parsed)
  end

  test "link in tweet should be parsed" do
    tweet = "foo baz https://t.co/3JqvHtLsXo"

    parsed = parse_links tweet

    assert_equal("foo baz <a href=\"https://t.co/3JqvHtLsXo\">https://t.co/3JqvHtLsXo</a>", parsed)
  end
end
