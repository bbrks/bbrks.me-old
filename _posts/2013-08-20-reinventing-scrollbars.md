---
layout: post
title:  "Stop reinventing the scrollbar"
date:   2013-08-20 19:37:24
categories: design blog
---

### We don't need page numbers on the web, you can scroll your way through a piece of text at the flick of a finger. But how do you know how far through an article you are?

I came across [a discussion](https://news.ycombinator.com/item?id=6238839) [or two](https://news.ycombinator.com/item?id=6239285) on Hacker News today about making indicators to display your progress while reading an article. Something that looked a little like this&hellip;

![Horizontal progress bar]({{ site.baseurl }}/assets/2013-08-20-reinventing-scrollbars/scroll.gif)

The idea is nice, but it does not translate well. The progress bar is horizontal, while the article you are reading is (presumably) vertical. This is poor [natural mapping][naturalmapping]. You scroll down to move the indicator bar across. It just doesn't make sense.
[naturalmapping]: http://en.wikipedia.org/wiki/Natural_mapping_(interface_design)

![Poor natural mapping]({{ site.baseurl }}/assets/2013-08-20-reinventing-scrollbars/natural-mapping.png)

Kindles & other E-Book readers have something similar. A horizontal bar along the bottom of the screen which displays how far through a book you are, along with chapter markers.

![Kindle progress bar]({{ site.baseurl }}/assets/2013-08-20-reinventing-scrollbars/kindle.jpg)

This sort of makes sense with a reader, you have defined pages, even if the content does reflow. You don't scroll vertically through a book on them. The page turns are horizontal, thus horizontal progress indicators make sense & have good mapping.

---

### Thing is though, we already have a vertical progress bar for the web that has been around for decades. It's called the scroll bar, you may have heard of it.

![Scrollbar History]({{ site.baseurl }}/assets/2013-08-20-reinventing-scrollbars/scrollbars.png)

"But Ben", I hear you say…

> "What about the comments section below an article which takes up two times the amount of space‽ Won't that throw the proportions off?"

Yes, yes it will random dude *(or dudette)*. There is an easy way around this though!

Simply hide all of the content which is not the article until the user reaches it. ***BOOM.*** You have a universal progress bar which everybody has been using since the 80s. (okay maybe not *everyone*)

"But how do you implement this" you ask? Easy. *(Be warned though, this code is untested!)*

{% highlight js %}
function isScrolledIntoView(elem) {
	var docViewTop = $(window).scrollTop();
	var docViewBottom = docViewTop + $(window).height();

	var elemTop = $(elem).offset().top;
	var elemBottom = elemTop + $(elem).height();

	return ((elemBottom >= docViewTop) && (elemTop <= docViewBottom));
}

var commentsElement = $('#comments');
$(window).scroll(function() {
	if(isScrolledIntoView(commentsElement)) {
		commentsElement.show();
	} else {
		commentsElement.hide();
	}
});
{% endhighlight %}

---

"But Ben!", - Hello again random dude/dudette.

> "What happens when a user is reading on an iOS or OS X device and the scrollbars hide when not in use?"

Frankly I think it sucks that they hide when not in use, at least on large screens. The least they can do is offer a few pixels as a visual indication. But alas, *Apple knows best.*<sup>/s</sup>

![Apple Scrollbars]({{ site.baseurl }}/assets/2013-08-20-reinventing-scrollbars/shrinking-scrollbars.jpg)

One alternative is to ignore iOS and OS X users. But that's not very nice. There are many scrolling libraries available that you can use, such as [NiceScroll](http://areaaperta.com/nicescroll/).

Or you can just make your own indicator like the one seen at the very start of the article. Just *don't use a horizontal indicator for vertical progression* :)

<blockquote class="smallcap">"But what happens when the article is split across several pages?"</blockquote>

Well then you've probably got bigger problems. An article shouldn't be split across multiple pages on the web! We have an *infinitely* long canvas to write on, along with an elegant way of moving through it. Why would you need to split it up?

<blockquote class="smallcap">"But ad revenue!"</blockquote>

Maybe there are better ways of monetising than forcing multiple pages of ads down your users throats? :)
