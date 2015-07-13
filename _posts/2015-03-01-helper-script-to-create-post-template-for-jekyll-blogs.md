---
tags: jekyll
---

It has been tedious to name a [Jekyll](https://jekyllrb.com) post file with the weird format. So, I created a python script to solve this. :)

The gist tries to solve not only the naming problem, but also adds helpers to create the required front-matter.

{% gist ayushgoel/70eff5e48afcc2d98b45 %}

Also, I have added a small wrapper in my blog over the script (which is added as a submodule) so that I don't have to play with the scripts parameters each time. You can have a look at it [here](https://github.com/ayushgoel/ayushgoel.github.io/blob/master/create-post).
