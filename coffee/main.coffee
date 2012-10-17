window.echo_tweets = (tweets) ->
    # a testing callback for tweet_timeline
    for tweet in tweets
        console.log(tweet.text)

embedder = (html_id, width) ->
    embed = (tweets) ->
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
                embed(tweets)

inject_timeline = (html_id, username, count, width=300) ->
    # add timeline tweets to the page
    tweet_timeline(embedder(html_id, width), username, count)

#inject_timeline "friends_tweets", "joshkunz", 10

months = ["Jan", "Feb", "March",
          "April", "May", "June",
          "July", "Aug", "Sep", "Nov",
          "Dec"]

twelve_hour = (_24_hour) ->
    hour = parseInt _24_hour
    hour += 1 #.get hours returns 0-23
    if hour > 12
        return ["#{hour - 12}", "pm"]
    return ["#{hour}", "am"]

# get a formatted date from something that can be
# parsed as a datestring
Handlebars.registerHelper("date", (date) ->
    dt = new Date(date)
    # ex Apr 12, 2007 10:45 AM"
    [hour, suffix] = twelve_hour dt.getHours()
    return "#{months[dt.getMonth()]} #{dt.getDate()}, 
            #{dt.getFullYear()} #{hour}
            #{dt.getMinutes()} #{suffix}"
)

t_pinboard = Handlebars.compile $("pinboard-template").html()

inject_pinboard = (view) ->
    $.ajax
        async: false
        url: "http://feeds.pinboard.in/json/#{view}"
        type: "json"
        success: (link_items) ->
            for link_item in link_items
                $("#linkroll").append(t_pinboard link_item)

inject_pinboard "u:joshkunz"
