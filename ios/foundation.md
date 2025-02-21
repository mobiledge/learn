---
title: Foundation
parent: iOS
---

1. TOC
{:toc}
# [Foundation](https://developer.apple.com/documentation/foundation)

## Topics
*based on [Developer Documentation](https://developer.apple.com/documentation) > [Foundation](https://developer.apple.com/documentation/foundation)* 
- [Numbers, Data, and Basic Values](https://developer.apple.com/documentation/foundation/numbers_data_and_basic_values)
- [Strings and Text](https://developer.apple.com/documentation/foundation/strings_and_text)
- [Collections](https://developer.apple.com/documentation/foundation/collections)
- [Dates and Times](https://developer.apple.com/documentation/foundation/dates_and_times)
- [Units and Measurement](https://developer.apple.com/documentation/foundation/units_and_measurement)
- [Data Formatting](https://developer.apple.com/documentation/foundation/data_formatting)
- [Filters and Sorting](https://developer.apple.com/documentation/foundation/filters_and_sorting)

## Fundamentals

## App Support

##### [Notifications](https://developer.apple.com/documentation/foundation/notifications)

```swift
NotificationCenter.default.post(name: "foo", object: nil, userInfo: nil)

let sel = #selector(self.doSomething(_:))
NotificationCenter.default.addObserver(self, selector: sel, name: "foo", object: nil)
```

## Concurrency

[Comparative Asynchronous Programming](https://ashfurrow.com/blog/comparative-asynchronous-programming/)


##### Promises

[google/promises](https://github.com/google/promises/blob/master/g3doc/index.md)

##### Promisekit

http://promisekit.org/docs/

[PromiseKit/Documentation/](https://github.com/mxcl/PromiseKit/tree/master/Documentation)


## Files and Data Persistence

## Networking

##### [URL Loading System](https://developer.apple.com/documentation/foundation/url_loading_system)

- [A modern network operation - Marcus Zarra](http://www.cimgf.com/2016/01/28/a-modern-network-operation/)
- [Session based - reddift](https://github.com/sonsongithub/reddift/tree/master/framework/Network)

##### Image Download & Cache

- [Kingfisher Wiki](https://github.com/onevcat/Kingfisher/wiki)

- [LazyTableImages - Sample Code](https://developer.apple.com/library/content/samplecode/LazyTableImages/Introduction/Intro.html#//apple_ref/doc/uid/DTS40009394)
