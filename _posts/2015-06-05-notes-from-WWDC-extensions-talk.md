---
tags: ios wwdc
---

* separate target
* Needs different entitlement
    * isolated address space
    * executes independantly
* Frameworks - encrypted
* Min deployment target to be ios 8 :(
    * App links to framework - change
    * all extensions in a framework, not changes
* NS_EXTENSION_UNAVAILABLE_IOS
* Sharing data - separate containers
    * shared container
* Extension and App can be running simultaenously. Synchronize data access
    * NSFileCoordination
    * coredata
    * sqlite
    * [NSUserDefaults initWithSuiteName:] Set up shared domain
    * Shared keychains - app groups

* be stateless, no general multitasking

Action extensions
-

* `NSExtensionPrincipalClass`
* `NSExtensionPointIdentifier`

![Access item in View Controller]({{ site.url }}/assets/ios-extension-access-item.png)

* `NSExtensionContext`
* `- loadItemForTypeIdentifier:options:completionHandler:`

![Completing share context]({{ site.url }}/assets/ios-extension-share-completion.png)
