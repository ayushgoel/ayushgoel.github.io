---
tags: ios fastlane pilot
---

[pilot][pilot] is yet another cool tool from [fastlane][fastlane] tool belt. It helps you manage all your [TestFlight][testflight] related work from your terminal.

Previously:
-

1. Create an archive from Xcode.
2. Repeatedly click "Submit", "Next", "Yes" etc type of buttons when submitting the build to iTunesConnect.
3. After uploading, login to iTunesConnect
4. Submit the build for external testing review including answering all the question asked in submission process.
5. Check if app reviewed and allowed for testing.
6. Repeat step 4 until build is reviewed and allowed for testing.
7. Once done, submit the app for testing by adding "What to test" and answering other questions asked.

Now:
-

1. Go to root project folder
2. `fastlane testflight`

How:
-

1. Install [fastlane][fastlane]. Check [Installation guide](https://github.com/fastlane/fastlane#installation).
2. `fastlane init` creates a `Fastfile` for you.
3. In your `Fastfile` create a new lane for testflight like this:

{% highlight ruby linenos %}
desc "Submit app to external testers"
lane :testflight do
    gym # builds your project
    pilot(distribute_external: true, # distribute to external testers
          changelog: "New build with fastlane") # "What to test"
end
{% endhighlight %}

Explore more at [fastlane][fastlane].

[fastlane]: http://fastlane.tools
[pilot]: https://github.com/fastlane/fastlane/tree/master/pilot
[testflight]: https://developer.apple.com/testflight/
