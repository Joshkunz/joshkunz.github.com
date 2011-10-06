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
		return("<a href=\"http://twitter.com/#/!search/"+match_string+"\">"+match_string+"</a>");
	});
    
	//find user info
    if (tweet.user === undefined) {
		twb = tweet.from_user;
	} else {
		twb = tweet.user.screen_name;
	}
	
	return {"text": tweet_text, "tweeted_by": twb}
}

(function ($) {
	$.fn.scrollToElement = function (speed, offset) {
		console.log("Running Scroll to:", $(this));
		$("body").animate({scrollTop: $(this).offset().top-offset}, speed);
	}
})(jQuery);

function decorate_links() {
	$("a").each(function (index) {
		if ($(this).attr("href")[0] == "#" && $(this).attr("href").length > 1) {
			$(this).click(function () {
				if ($("#header.container").css("position") == "fixed") {
					$($(this).attr("href")).scrollToElement(250, $("#header.container").height()+10);
				} else {
					$($(this).attr("href")).scrollToElement(250, 0);
				}
			});
		}
	});
}

function check_resize() {
	if ($(window).width() <=700) {
		if ($("ol.media-links").prev().attr("class") == "nav-links")
			{$("ol.media-links").insertBefore($("ol.nav-links"));}
	} else if ($(window).width() > 700) {
		if ($("ol.nav-links").prev().attr("class") == "media-links")
			{$("ol.nav-links").insertBefore($("ol.media-links"));}
	}
}

$(document).ready(function () {
	
	
	//Decorate the in-page links to use smooth scrolling
	decorate_links();
	check_resize();
	
	$(window).resize(check_resize);
	
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