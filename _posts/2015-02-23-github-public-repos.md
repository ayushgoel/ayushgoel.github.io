---
tags: github ayushgoel
---

My public repositories as added by [GitHub pages](https://pages.github.com/) in `site` variable of this [Jekyll](http://jekyllrb.com/) installation.

{% for repository in site.github.public_repositories %}
  * [{{ repository.name }}]({{ repository.html_url }})
{% endfor %}

Printed using code:

{% highlight html linenos %}
{% raw %}

{% for repository in site.github.public_repositories %}
  * [{{ repository.name }}]({{ repository.html_url }})
{% endfor %}

{% endraw %}
{% endhighlight %}
