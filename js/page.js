function format_tweet (tweet) {
	
	//Find Links
	tweet_text = tweet.text.replace(/\b\S*\.[A-Za-z]{2,4}\S*\b/g, function (match_string) { 
		return("<a href=\""+match_string+"\">"+match_string+"</a>");
	});
	
	//Find twitter handles
	tweet_text = tweet_text.replace(/@\S*\b/g, function (match_string) {
		return("<a href=\"http://twitter.com/"+match_string.slice(1)+"\">"+match_string+"</a>");
	});
	
	//Find hash-tags
	tweet_text = tweet_text.replace(/#\S*\b/g, function (match_string) {
		return("<a href=\"#\" class=\"hash-tag\">"+match_string+"</a>");
	});
    
	//find user info
    if (tweet.user === undefined) {
		twb = tweet.from_user;
	} else {
		twb = tweet.user.screen_name;
	}
	
	return {"text": tweet_text, "tweeted_by": twb}
}

$(document).ready(function () {
	
	//load 3 most recent tweets
	$.ajax({
		url: "https://api.twitter.com/1/statuses/user_timeline.json?include_rts=true&screen_name=Joshkunz&count=3",
		type: "GET",
		dataType: "jsonp",
		success: function (tweets) {
			$.each(tweets, function (tweets_index, tweet) {$("#tweet-template").tmpl(format_tweet(tweet)).appendTo("#tweets");});
			$("#tweets").show(500);
		}
	});
	
	
});