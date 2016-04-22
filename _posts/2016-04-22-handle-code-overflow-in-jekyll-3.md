---
tags: jekyll code highlight
---

Code overflow in Jekyll 3 by default uses a `visible` value.

To allow users to scroll the code you can add

{% highlight css linenos %}
.highlight {
  overflow-x: scroll;
}
{% endhighlight %}

to your `syntax.css` file.

This will add scroll bars to your code for viewing overflowing text.

Reference: [MDN-overflow-x](https://developer.mozilla.org/en/docs/Web/CSS/overflow-x)
