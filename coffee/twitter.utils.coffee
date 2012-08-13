# I should start by saying that the async nature of ajax makes things
# unnecciarily complex. This is a fairly simple process but I have to
# deal with the fact that javascript wants to throw everything around
# when I want to fetch an exterior resource...

tweet_cmp = (a, b) ->
    # compare two tweets based on thier date
    a_at = Date.parse(a.created_at)
    b_at = Date.parse(b.created_at)
    if a_at > b_at 
        return -1
    else if b_at < a_at
        return 1
    else
        return 0

fetch_tweets = (callback, tweets, users, count, since=null) ->
    # fetch count tweets for the next user in the list
    args = 
        user_id: users.pop()
        count: count
        include_rts: "true"
        exclude_replies: "true"
        trim_user: "true"
    if since? then args.since_id = since
    $.ajax
        url: "http://api.twitter.com/1/statuses/user_timeline.json"
        type: "jsonp"
        data: args
        success: (data) -> 
            update_tweet_list callback, data, tweets, users, count, since


update_tweet_list = (callback, newtweets, oldtweets, users, count, since) ->
    # update the tweet list with the new tweets, find the
    # since_id (so we do small requests) and truncate the list
    tweets = oldtweets
    for tweet in newtweets
        Heap.push(tweets, tweet, tweet_cmp)
    tweets = Heap.nsmallest(tweets, count, tweet_cmp)
    if users.length == 0
        callback tweets
    else
        #console.log("first", tweets[1].id, "last", tweets[tweets.length-1].id)
        #console.log(tweets)
        #return
        if tweets.length >= count
            fetch_tweets callback, tweets, users, count, tweets[tweets.length-1].id
        else
            fetch_tweets callback, tweets, users, count

window.tweet_timeline = (callback, username, count=10) ->
    tweets = []
    $.ajax
        url: "http://api.twitter.com/1/friends/ids.json"
        type: 'jsonp'
        data:
            screen_name: username
        headers:
            Origin: "joshkunz.com"
        success: (data) ->
            fetch_tweets callback, tweets, data.ids, count
    # ok, now that we know that we have the users...



