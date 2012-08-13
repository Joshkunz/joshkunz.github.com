window.echo_tweets = (tweets) ->
    # a testing callback for tweet_timeline
    for tweet in tweets
        console.log(tweet.text);

embedder = (tweets) ->
    #embeds the tweets
    if tweets.length == 0
        $("head").append("<script type=\"text/javascript\" 
        src=\"http://platform.twitter.com/widgets.js\"></script>")
    $.ajax
        url: "http://api.twitter.com/1/statuses/oembed.json"
        type: 'jsonp'
        data:
            id: tweets.pop().id_str
            maxwidth: width
        success: (oembed) ->
            $("##{html_id}").append oembed.html
            embedder(tweets, callback)

inject_timeline = (html_id, username, count, width=300) ->
    # add timeline tweets to the page
    tweet_timeline(embedder, username, count)

#inject_timeline "friends_tweets", "sswaner", 10
