---
tags: ios coredata
---

I would suggest this to everybody who is writing an app, whose true data lies at some server instead of the app itself. Think of any app that needs internet connection.

For example I will take the app I developed, [Checkvistle](https://itunes.apple.com/us/app/checkvistle-checkvist-on-go/id995611134).
The true data was with [Checkvist](http://checkvist.com). The data could change when my app was in background or killed. Even when running, the user could be making changes to his tasks on a desktop, and I would come to know about it only after making a HTTP request.

##Why?

1. **Coredata is heavy weight and it’s small nuances and threading issues will slow you down considerably**
    
    I  don’t mean it to be heavy on computing or memory resources, but it is heavy on development support. And if you are new to iOS development, then you are going to spend some good time on this.
    
2. **Migration**

    Change is inevitable, and sometimes frequent. Coredata migration is not easy and requires effort.
    
3. **Difficult to test**

    Testing of core data code is not easy. Even though you may get help from frameworks like [OCMock](http://ocmock.org/) etc, it is not easy. And don’t forget Point 2, your model changes, your code changes and your tests change too.
    
##Alternative

Store the response from your true data source on a file!
Replace it whenever a newer version is received from the source.
Replace it whenever you make a change on your app.
Use [Etag](https://en.wikipedia.org/wiki/HTTP_ETag) to save yourself from excessive data usage.

Small, simple apps like [Checkvistle](https://itunes.apple.com/us/app/checkvistle-checkvist-on-go/id995611134) don’t need the code I have to handle core data.
