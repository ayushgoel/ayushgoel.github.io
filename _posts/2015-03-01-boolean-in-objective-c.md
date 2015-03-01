---
tags: objective-c bool
---

This post is inspired from the eye-opener article -> [bignerdranch][bignerdranch].

I always had this question, "Why does Objective-C need a `BOOL` when C gives it a free `bool`, which effectively works the same?".

Well, I couldn't have been more wrong. `BOOL` and `bool` are entirely different beasts.

`BOOL` is a typedef of `unsigned int`. Just like `Boolean`, which is defined at `/usr/include/MacTypes.h` (Also available [here](https://opensource.apple.com/source/CarbonHeaders/CarbonHeaders-18.1/MacTypes.h))

```
typedef unsigned char   Boolean;
```

Also, `YES` and `NO` are macros for 1 and 0. [Reference](http://nshipster.com/`BOOL`/)

This means that our usual comparisons might fail. Example:

```
12 == YES
```

For more such examples, look at [bignerdranch].

The thing to note is that, you should be careful about the same comparisons for `Boolean` too.

[bignerdranch]: http://www.bignerdranch.com/blog/`BOOL`s-sharp-corners/)

