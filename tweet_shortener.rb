def dictionary(phrase = "")
  case phrase.capitalize
  when "Hello"
    return "hi"
  when "To", "Two", "Too"
    return "2"
  when "For", "Four"
    return "4"
  when "Be"
    return "b"
  when "You"
    return "u"
  when "At"
    return "@"
  when "And"
    return "&"
  else
    return phrase
  end
end

def word_substituter(long_tweet)
  array = long_tweet.split

  array.collect!{|words|
    dictionary(words)
  }

  array.join(" ")
end

def bulk_tweet_shortener(tweets)
  shorter_tweets = tweets.each{|items|
    puts word_substituter(items)
  }
end

def selective_tweet_shortener(tweet)
  new_tweet = tweet

  if tweet.length > 140
    new_tweet = word_substituter(tweet)
  end

  new_tweet
end

def shortened_tweet_truncator(tweet)
  new_tweet = selective_tweet_shortener(tweet)

  if new_tweet.length > 140
    new_tweet = new_tweet[0, 140]
  end

  new_tweet
end
