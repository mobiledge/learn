---
title: Coredata
parent: iOS
---

1. TOC
{:toc}
# Core Data

[swift-persistence/core-data](https://rabin-aapl.gitbook.io/swift-persistence/core-data/)

*Next: A manual migration*

#### Resources
- [Core Data Programming Guide](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/index.html)
- [Getting Started with Core Data Tutorial](https://www.raywenderlich.com/7569-getting-started-with-core-data-tutorial)
- [Core Data Cheat Sheet for Swift iOS Developers](https://www.andrewcbancroft.com/2015/02/18/core-data-cheat-sheet-for-swift-ios-developers/)

#### Notes

*Prior to iOS 10, creating the Core Data stack involved:
1. Create `NSManagedObjectModel` (from .momd file URL)
2. Create `NSPersistentStoreCoordinator` (using the ManagedObjectModel)
3. Create `NSManagedObjectContext` (using the PersistentStoreCoordinator)
4. Add `NSPersistentStore` to PersistentStoreCoordinator (using .sqlite store URL)

see: [Initializing the Core Data Stack](https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreData/InitializingtheCoreDataStack.html)*

see: [Getting Started with Combine and Core Data](https://www.mattmoriarity.com/observing-core-data-changes-with-combine/getting-started/)
