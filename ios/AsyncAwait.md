---
title: Asyncawait
parent: iOS
---

1. TOC
{:toc}
# Async/Await


## [Modern Concurrency in Swift](https://www.kodeco.com/books/modern-concurrency-in-swift)

> Learning Path / [Concurrency in iOS](https://www.kodeco.com/ios/paths/ios-concurrency)  
> https://github.com/kodecocodes/mcon-materials/tree/editions/2.0


###### Chapter 1



###### Chapter 2
> mcon-materials/02-getting-started-with-async-await/projects/final/SuperStorage/[ListView.swift](https://github.com/kodecocodes/mcon-materials/blob/editions/2.0/02-getting-started-with-async-await/projects/final/SuperStorage/ListView.swift)  
> [iTunes Search API](https://developer.apple.com/library/archive/documentation/AudioVideo/Conceptual/iTuneSearchAPI/index.html#//apple_ref/doc/uid/TP40017632-CH3-SW1)

**Task Wrapping**\
Executing asynchronous operations within a synchronous context.

```swift
func synchronousFunction() {
    Task {
        let result = await asynchronousFunction()
        print(result)
    }
}
```

**@MainActor**\
Specififies that an async func should be executed on the main thread or main queue.


###### Chapter 3
#### AsyncSequence [](https://developer.apple.com/documentation/swift/asyncsequence)
- _is a protocol_

```swift
struct Counter: AsyncSequence, AsyncIteratorProtocol {
    typealias Element = Int
    var current = 1

    mutating func next() async throws -> Int? {
        guard current <= 10 else {
            return nil
        }
        try await Task.sleep(for: .seconds(1))
        let result = current
        current += 1
        return result
    }

    func makeAsyncIterator() -> Counter {
        return self
    }
}
```
```swift
Task {
    for try await elem in Counter() {
        print(elem)
    }
}
```

###### Chapter 4
#### AsyncStream & AsyncThrowingStream [](https://developer.apple.com/documentation/swift/asyncstream)
- _produces values from a closure pased during initialization_
- _2 variants: unfolding & continuation_
  - _unfolding is pull-based_
  - _continuation is push-based (buffers early elements and returns them all at once)_
- _both are structs_

```swift 
/// Unfolding variant
var current = 1
let items = AsyncThrowingStream<Int, Error> {
    guard current <= 10 else {
        return nil
    }
    try await Task.sleep(for: .seconds(1))
    let result = current
    current += 1
    return result
}
```
```swift
/// Continuation variant
let items = AsyncThrowingStream<Int, Error> { continuation in
    Task {
        try await Task.sleep(for: .seconds(1))
        continuation.yield(1)

        try await Task.sleep(for: .seconds(1))
        continuation.yield(2)

        try await Task.sleep(for: .seconds(1))
        continuation.yield(3)

        continuation.finish()
    }
}
```
```swift
Task {
    for try await item in items {
        print(item)
    }
}
```

> https://youtu.be/2-3hQZQc6Sk  
> https://github.com/apple/swift-async-algorithms  
> [AsyncChannel](https://github.com/apple/swift-async-algorithms/blob/main/Sources/AsyncAlgorithms/AsyncAlgorithms.docc/Guides/Channel.md) _like `Subject` in Combine_ 


###### Chapter 6
#### CheckedContinuation [](https://developer.apple.com/documentation/swift/checkedcontinuation)
```swift
func fetch(completion: @escaping (Int) -> Void) {
    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
        completion(100)
    }
}
func fetch2() async -> Int {
    let result: Int = await withCheckedContinuation({ continuation in
        fetch { r in
            continuation.resume(returning: r)
        }
    })
    return result
}
```

###### Chapter 7
#### TaskGroup [](https://developer.apple.com/documentation/swift/taskgroup)
