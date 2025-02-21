---
title: Cloudkit
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

# CloudKit

[Developer Documentation](https://developer.apple.com/documentation) > 
[CloudKit](https://developer.apple.com/documentation/cloudkit)

Guides:\
[iCloud Design Guide](https://developer.apple.com/library/archive/documentation/General/Conceptual/iCloudDesignGuide/Chapters/Introduction.html#//apple_ref/doc/uid/TP40012094-CH1-SW1)\
[CloudKit Quick Start](https://developer.apple.com/library/archive/documentation/DataManagement/Conceptual/CloudKitQuickStart/Introduction/Introduction.html)\


*Steps:*\
*1. CRUD on single resource*\
*2. Relationships*\
*3. Subscriptions*\

## Resources
- [lynda.com](https://www.lynda.com) > 
[Building iOS Apps with CloudKit](https://www.lynda.com/iCloud-tutorials/Building-iOS-Apps-CloudKit/761943-2.html)

## Code

[CloudKitHelpers](https://github.com/mobilege/ios-development/tree/master/CloudKitHelpers)

```swift
/**
 Persists CKRecord instances.
 */
class CloudKitService {
```

```swift
/**
 Persists & caches model instances that conform to CloudKitModel.
*/
class CloudKitStore<T: CloudKitModel> {
```

```swift
/**
 Makes model instances usable with CloudKit.
 */
protocol CloudKitModel: Equatable {
```
