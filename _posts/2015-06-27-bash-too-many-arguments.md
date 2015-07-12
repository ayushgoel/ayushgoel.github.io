---
tags: bash error
---

{% highlight bash %}
  if test ! -f $path
{% endhighlight %}

The above script would create bash warnings for you like

{% highlight bash %}
  test: too many arguments
{% endhighlight %}

The problem here is that the path contains spaces in it, and thus the test gets “more than one arguments”.

The solution for the above problem is a pretty simple one, wrap the path in inverted commas 😅.

{% highlight bash %}
  if test ! -f “$path”
{% endhighlight %}
