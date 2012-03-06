parseTweet = (tweet) ->
	tweet_text = tweet.text.replace /\b\S*\.[A-Za-z]{2,4}\S*\b/g, (url) ->
		return "<a href='#{url}'>#{url}</a>"
	tweet_text = tweet_text.replace /@\S*\b/g, (username) ->
		return "<a href='http://twitter.com/#{username.slice 1}'>#{username}</a>"
	tweet_text = tweet_text.replace /#\S*\b/g, (hashtag) ->
		return "<a href='http://twitter.com/#!/search/#{hashtag}'>#{hashtag}</a>"

	if not tweet.user? then twb = tweet.from_user else twb = tweet.user.screen_name
	
	return {
		text: tweet_text
		tweeted_by: twb
	}

( ($) ->
	$.fn.scrollToElement = (speed, offset) ->
		console.log "Running scroll to:", @
		$("body").animate
			scrollTop: $(@).offset().top-offset, speed
) jQuery

decorateLinks = ->
	$("a").each ->
		if $(@).attr("href")[0] is "#" and $(@).attr("href").length > 1
			$(@).click ->
				position = $($(@).attr "href")
				if $("#header.container").css "position" is "fixed"
					position.scrollToElement 250, $("#header.container").height()+10
				else
					position.scrollToElement 250, 5

checkResize = ->
	if $(window).width() <= 700
		if $("ol.media-links").prev().attr "class" == "nav-links"
			$("ol.media-links").insertBefore $("ol.nav-links")
	else if $(window).width() > 700
		if $("ol.nav-links").prev().attr "class" == "nav-links"
			$("ol.nav-links").insertBefore $("ol.media-links")

fetchTweets = ->
	$.ajax
		url:"https://api.twitter.com/1/statuses/user_timeline.json?include_rts=true&screen_name=Joshkunz&count=5"
		type: "GET"
		dataType: "jsonp"
		success: (tweets) ->
			for tweet in tweets
				$("#tweet-template").tmpl(parseTweet tweet).appendTo "#tweets"
				$("#tweets").show 500

$ ->
	decorateLinks()
	checkResize()
	fetchTweets()

	$(window).resize checkResize

