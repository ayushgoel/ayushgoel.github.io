---
tags: objective-c bool
---

This post is inspired from the eye-opener article -> [bignerdranch][bignerdranch].

I always had this question, "Why does Objective-C need a `BOOL` when C gives it a free `bool`, which effectively works the same?".

Well, I couldn't have been more wrong. `BOOL` and `bool` are entirely different beasts.

`BOOL` is a typedef, defined at `/usr/include/objc/objc.h` (Also available [here][objc.h])

```
typedef signed char	BOOL;
```

Similar to, `Boolean`, which is defined at `/usr/include/MacTypes.h` (Also available [here][MacTypes.h])

```
typedef unsigned char Boolean;
```

Also, `YES` and `NO` are macros for 1 and 0. [Reference][objc.h]

```
#define YES (BOOL)1
#define NO (BOOL)0
```

This means that our usual comparisons might fail. Example:

```
12 == YES
```

For more such examples, look at [bignerdranch].

The thing to note is that, you should be careful about the same comparisons for `Boolean` too.

[bignerdranch]: http://www.bignerdranch.com/blog/bools-sharp-corners/
[objc.h]: http://www.opensource.apple.com/source/objc4/objc4-371.1/runtime/objc.h
[MacTypes.h]: https://opensource.apple.com/source/CarbonHeaders/CarbonHeaders-18.1/MacTypes.h
