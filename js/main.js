// Generated by CoffeeScript 1.3.3
(function() {
  var echo_tweets;

  echo_tweets = function(tweets) {
    var tweet, _i, _len, _results;
    _results = [];
    for (_i = 0, _len = tweets.length; _i < _len; _i++) {
      tweet = tweets[_i];
      _results.push(console.log(tweet.text));
    }
    return _results;
  };

}).call(this);
