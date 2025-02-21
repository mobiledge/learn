---
title: Persistence
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

# Persistence
- Persistence: 
[Core Data](https://github.com/mobilege/ios-development/blob/master/coredata.md), 
[CloudKit](https://github.com/mobilege/ios-development/blob/master/CloudKit.md#cloudkit), 
[Firebase](https://github.com/mobilege/ios-development/blob/master/firebase.md), 
[Realm](https://github.com/mobilege/ios-development/blob/master/realm.md)
- [Developer Documentation](https://developer.apple.com/documentation) > 
[Foundation](https://developer.apple.com/documentation/foundation) > 
Files and Data Persistence > 
[File System](https://developer.apple.com/documentation/foundation/file_system)
- [Developer Documentation](https://developer.apple.com/documentation) > 
[Foundation](https://developer.apple.com/documentation/foundation) >
Files and Data Persistence > 
[Archives and Serialization](https://developer.apple.com/documentation/foundation/archives_and_serialization)
- [Developer Documentation](https://developer.apple.com/documentation) > 
[Foundation](https://developer.apple.com/documentation/foundation) > 
Files and Data Persistence > 
[Preferences](https://developer.apple.com/documentation/foundation/preferences)
- [nsscreencast/306-codable-caching](https://github.com/nsscreencast/306-codable-caching)
- https://github.com/SwiftyBeaver/SwiftyBeaver/blob/master/Sources/SBPlatformDestination.swift

## File System
```swift
// MARK: - File System Utils
static func writeToDocumentsDirectory(pathComponents: [String], data: Data) throws {
    var url = URL.documentsDirectory
    for component in pathComponents {
        url = url.appending(path: component)
    }
    try data.write(to: url)
}

static func readFromDocumentsDirectory(pathComponents: [String]) throws -> Data {
    var url = URL.documentsDirectory
    for component in pathComponents {
        url = url.appending(path: component)
    }
    let data = try Data(contentsOf: url)
    return data
}
```

```swift
// create the folder if it doesn’t exist 
let foldername = "MyFolder"
let fm = FileManager.default
let docsurl = try fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
let myfolder = docsurl.appendingPathComponent(foldername)
try fm.createDirectory(at:myfolder, withIntermediateDirectories: true)
```

```swift
// ask for an array of the directory’s contents
let fm = FileManager.default
let docsurl = try fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
let arr = try fm.contentsOfDirectory(at:docsurl, includingPropertiesForKeys: nil)
arr.forEach{ print($0.lastPathComponent) } // MyFolder
```
> Programming iOS 12 by Matt Neuburg



## Bundle
```swift
// MARK: - Bundle Utils
static func readFromBundle(resource: String, withExtension ext: String? = nil) throws -> Data {
    guard let url = Bundle.main.url(forResource: resource, withExtension: ext) else {
        throw "Resource \(resource) doesn't exist in bundle!"
    }
    let data = try Data(contentsOf: url, options: .mappedIfSafe)
    return data
}
```


## User Defaults

_Model + M+S + Service Approach. Doesn't use protocols._

https://github.com/mobilege/ios-development/blob/7739ad6ee62b6b5f70f7b491a4ac8c43240837d9/_experiments/UserDefaultsService/UserDefaultsService/UserDefaultsService.swift#L10-L25





## JSON
```swift
protocol JSONRepresentable: Codable {
    static var jsonDecoder: JSONDecoder { get }
    static var jsonEncoder: JSONEncoder { get }
    init(jsonData: Data) throws
    init(jsonString: String) throws
    func toJSONData() throws -> Data
    func toJSONString() throws -> String
}

extension JSONRepresentable {
    
    static var jsonDecoder: JSONDecoder { JSONDecoder() }
    static var jsonEncoder: JSONEncoder { JSONEncoder() }
    
    init(jsonData: Data) throws {
        self = try Self.jsonDecoder.decode(Self.self, from: jsonData)
    }
    
    init(jsonString: String) throws {
        let data = Data(jsonString.utf8)
        try self.init(jsonData: data)
    }
    
    func toJSONData() throws -> Data {
        let data = try Self.jsonEncoder.encode(self)
        return data
    }
    
    func toJSONString() throws -> String {
        let data = try toJSONData()
        let str = String(decoding: data, as: UTF8.self)
        return str
    }
}
```
