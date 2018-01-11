---
title: iOS Non Responsive Window
tags: iOS
---

Recently I got a strange log:

```
unexpected nil window in __dispatchPreprocessedEventFromEventQueue, _windowServerHitTestWindow: <UIWindow: 0x618000079880; frame = (0 0; 375 667); autoresize = W+H; userInteractionEnabled = NO; gestureRecognizers = <NSArray: 0x6040000f45d0>; layer = <UIWindowLayer: 0x6030000aaf50>>
```

This would happen whenever I tapped anywhere on the screen. No Google magic could explain what was wrong.

Solution was pretty easy. I had disabled interactions on my key window. Reenabling them resolved it.

```objc
[[[UIApplication sharedApplication] keyWindow] setUserInteractionEnabled:YES];
```
