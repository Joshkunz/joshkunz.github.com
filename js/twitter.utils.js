// Generated by CoffeeScript 1.3.3
(function() {
  var fetch_tweets, tweet_cmp, update_tweet_list;

  tweet_cmp = function(a, b) {
    var a_at, b_at;
    a_at = Date.parse(a.created_at);
    b_at = Date.parse(b.created_at);
    if (a_at > b_at) {
      return -1;
    } else if (b_at > a_at) {
      return 1;
    } else {
      return 0;
    }
  };

  fetch_tweets = function(callback, tweets, users, count, since) {
    var args;
    if (since == null) {
      since = null;
    }
    args = {
      user_id: users.pop(),
      count: count,
      include_rts: "true",
      exclude_replies: "true",
      trim_user: "true"
    };
    if (since != null) {
      args.since_id = since;
    }
    return $.ajax({
      url: "http://api.twitter.com/1/statuses/user_timeline.json",
      type: "json",
      data: args,
      success: function(data) {
        return update_tweet_list(callback, data, tweets, users, count(since));
      }
    });
  };

  update_tweet_list = function(callback, newtweets, oldtweets, users, count, since) {
    var tweet, tweets, _i, _len;
    tweets = oldtweets;
    for (_i = 0, _len = newtweets.length; _i < _len; _i++) {
      tweet = newtweets[_i];
      Heap.push(tweet, tweets, tweet_cmp);
    }
    tweets = Heap.nlargest(tweets, count, tweet_cmp);
    if (users === []) {
      return callback(tweets);
    } else {
      return fetch_tweets(callback, tweets, users, count, tweets[-1].id);
    }
  };

  window.tweet_timeline = function(callback, username, count) {
    var tweets;
    if (count == null) {
      count = 10;
    }
    tweets = [];
    return $.ajax({
      url: "http://api.twitter.com/1/friends/ids.json",
      type: 'json',
      data: {
        screen_name: username
      },
      headers: {
        Origin: "joshkunz.com"
      },
      success: function(data) {
        return fetch_tweets(callback, tweets, data.ids, count);
      }
    });
  };

}).call(this);
