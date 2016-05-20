---
tags: git web blobdiff
---

Every one has faced the issue of Github not showing the complete blob diff for a file because it is too large. It asks you to see the diff on your own machine, locally.

![Github Diff too big file]({{ site.url }}/assets/github-diff-too-big-file.png)
![Github Diff too big]({{ site.url }}/assets/github-diff-too-big.png)

If you are my kind who doesn't like seeing big diffs in terminal, then this solution is for you.

Git has a hidden feature to let you browse [your repository on browser][instaweb-scm].

    git-instaweb - Instantly browse your working repository in gitweb

Once you start the server for your repo

    git instaweb

The issue is that there is not straight way of looking at blob diff between two specific commits.

Digging into the documentation I found that passing the correct the parameters can help you see the diff.

    let SHA1 = SHA of commit to check diff from
    let SHA2 = SHA of commit to check diff to

Once we have SHA1 and SHA2 resolved,
Just create the URL like:

{% highlight HTML linenos %}
http://127.0.0.1:1234/? # Endpoint on which git is running instaweb
p=.git;
a=blobdiff;
f=file-path-to-check-diff-of;
hb=SHA1;
hpb=SHA2
{% endhighlight %}

Just open this URL in your favourite browser and you would be able to see the diff of the file.

[instaweb-scm]: https://git-scm.com/docs/git-instaweb
