---
tags: jekyll
---

### Problem:
I needed a place to host simple pages when necessary for my personal apps. Like a privacy policy for my app. I don't want to show it as a part of my blog (for obvious reasons).

### Solution:

What I essentially need is a filter on all my posts to be shown.

```
new_posts = filter(posts)
```

Since, Jekyll uses liquid templating engine, we can rely on that for our filter.

Jekyll allows you to add meta data to posts using [front matter](https://jekyllrb.com/docs/front-matter/). So I added a tag to posts I didn't want to show as `DO_NOT_SHOW_IN_POSTS`. Also, I filtered out these posts in [index.html](https://github.com/ayushgoel/ayushgoel.github.io/blob/master/index.html#L8), and voila, the blog no more shows a link to these posts. They are accessible only if you have link to them.

{% highlight HTML linenos %}
{% raw %}

{% if post.tags contains 'DO_NOT_SHOW_IN_POSTS' %}
  {% else %}
{% endif %}

{% endraw %}
{% endhighlight %}

You can check [this post](https://github.com/ayushgoel/ayushgoel.github.io/blob/master/_posts/2016-05-05-accelerate-privacy-policy.md) to see how the tag is added to the post.
