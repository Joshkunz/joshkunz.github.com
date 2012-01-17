#mustache templates
templates =
	tweet: """
	<div class="span5 tweet">
		<p>{{{ text }}}</p>
		<small>@<a href="http://twitter.com/{{ tweeted_by }}">{{ tweeted_by }}</a></small>
		{{#in_reply_to}}
			<span>in reply to @<a href="{{in_reply_to}}">{{in_reply_to}}</a></span>
		{{/in_reply_to}}
	</div>
	"""
	
render = (templateName, values) ->
	console.log "Rendering", templateName, "with values", values
	$($.mustache templates[templateName], values)

formatTweet = (tweet) ->
	tweet_text = tweet.text.replace /\b\S*\.[A-Za-z]{2,4}\S*\b/g, (match) ->
		"<a href=\"#{match}\">#{match}</a>"
	tweet_text = tweet_text.replace /@\S*\b/g, (match) ->
		"<a href=\"http://twitter.com/#{match.slice 1 }\">#{match}</a>"
	tweet_text = tweet_text.replace /#\S*\b/g, (match) ->
		"<a href=\"http://twitter.com/#/!search/#{match}\">#{match}</a>"
		
	twb = if tweet.user? tweet.from_user else tweet.user.screen_name
	
	data =
		text: tweet_text
		tweeted_by: twb
		in_reply_to: tweet.in_reply_to_screen_name
	
(($) ->
	$.fn.scrollToElement = (offset, speed=500) ->

		$("body").animate
			scrollTop: $(@).offset().top-offset,
			speed
) jQuery

decorate_links = ->
	$("a").each ->
		if $(@).attr("href")[0] is "#" and $(@).attr("href").length > 1
			$(@).click ->
				if $("#header.container").css("position")  == "fixed"
					$($(@).attr "href").scrollToElement 40
				else
					$($(@).attr "href").scrollToElement 5
					
check_resize = ->
	if $(window).width() <= 700 and $("ol.media-links").prev().attr "class" == "nav-links"
		$("ol.media-links").insertBefore $("ol.nav-links")
	else if $(window).width() > 700 and $("ol.nav-links").prev().attr "class" == "media-links"
		$("ol.nav-links").insertBefore $("ol.media-links")
		
$ ->
	#decorate_links()
	check_resize()
	
	prettyPrint()
	
	$(window).resize check_resize
	
	#Twitter Stuff
	$.ajax
		url: "https://api.twitter.com/1/statuses/user_timeline.json?include_rts=true&screen_name=Joshkunz&count=3"
		type: "GET"
		dataType: "jsonp"
		success: (tweets) ->
			console.log tweets
			for tweet in tweets
				render( "tweet", formatTweet tweet ) .appendTo "#tweets-container"
			$("#tweets, #tweets-container").show 500