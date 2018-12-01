---
tags: ios core-data
---

### 1. Notes

* Three types of concurrency available for NSManagedObjectContext
  - Main thread linked to UI (NSMainQueueConcurrencyType)
  - Private queue for background tasks (NSPrivateQueueConcurrencyType)
  - Confinement for legacy (NSConfinementConcurrencyType)
    - used with
      - serialised dispatch_queue or
      - NSOperationQueue with max concurrency one
    - harder to manage
* To simplify usage of Core Data APIs, use NSMainQueueConcurrencyType
  - View controllers and other UI components can use directly and are not required to know about performBlock: APIs.
* An instance of `NSManagedObject` is owned by the `NSManagedObjectContext` it was created in
  - Access allowed in only the NSOperationQueue (or dispatch_queue) the related NSManagedObjectContext is related to.
  - Use objectID of NSManagedObject to pass around objects.
* Use `performBlock:` to do tasks on NSManagedObjectContext.
