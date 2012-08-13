echo_tweets = (tweets) ->
    # a testing callback for tweet_timeline
    for tweet in tweets
        console.log(tweet.text);
