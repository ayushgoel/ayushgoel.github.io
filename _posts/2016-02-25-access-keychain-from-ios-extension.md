---
title: Access Keychain From iOS Extension
tags: iOS extension
---

Accessing keychain on iOS is pretty easy, given that you are using [SSKeychain][1].

Surprisingly, keychain sharing on iOS is also pretty easy. Keychain access is determined by the Keychain Group your app is using.

Since the containing app and an extension are built as two different targets, to share a keychain between them, you need to build them with same Keychain Group.

Here is how it looks like to set Keychain Group in Xcode (screenshot from Xcode 7.2).

![Keychain group selection in Xcode](/assets/ios-keychain-group-selection.png)

Set this value to same string for both your app and the extension target. And that is it! Access the keychain using the API of [SSKeychain][1] in any of the implementation files now.

[1]: https://github.com/soffes/sskeychain
