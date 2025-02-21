---
title: Networking
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

# Networking

[Developer Documentation](https://developer.apple.com/documentation) > 
[Foundation](https://developer.apple.com/documentation/foundation) > 
[URL Loading System](https://developer.apple.com/documentation/foundation/url_loading_system)


## Table of Contents
- [Architecture & Techniques](#code-examples)
- [Promises](#promises)
- [Reactive](#reactive)
- [Image Download](#image-download)
- [Misc](#misc)


#### Architecture & Techniques
- [swift-request](https://github.com/carson-katri/swift-request) _Uses Swift Result Builders_
- [siesta](https://github.com/bustoutsolutions/siesta) _Resource Based_
- [Tiny Networking Library](https://talk.objc.io/episodes/S01E1-tiny-networking-library) | objc.io
- [HTTP in Swift](https://davedelong.com/blog/2020/06/27/http-in-swift-part-1/) 10 Part - Dave DeLong
- [Advanced iOS Development: Working with APIs - lynda.com](https://www.linkedin.com/learning/advanced-ios-development-working-with-apis)
- [Deep Dive with NSOperation - NSScreencast](https://nsscreencast.com/series/8-deep-dive-with-nsoperation)
- [Networking - Swift Talk  Collection ](https://talk.objc.io/collections/networking)
- [RequestBuilder/Source/RequestBuilder.swift](https://github.com/mergesort/RequestBuilder/blob/master/Source/RequestBuilder.swift)
- [Under the hood of Futures & Promises in Swift - swiftbysundell](https://www.swiftbysundell.com/posts/under-the-hood-of-futures-and-promises-in-swift)
- [A Simple Approach to Thread-Safe Networking in iOS Apps](https://robots.thoughtbot.com/a-simple-approach-to-thread-safe-networking-in-ios-apps)
- Canceling requests - [Using tokens to handle async Swift code](https://www.swiftbysundell.com/posts/using-tokens-to-handle-async-swift-code) 


## Image Download

- iOS Programming: The Big Nerd Ranch Guide, 6th Edition > 21. Collection Views > Downloading the Image Data
- [Prefetching for UITableView](https://andreygordeev.com/2017/02/20/uitableview-prefetching/)
- 3rd Party: [SDWebImage](https://github.com/SDWebImage/SDWebImage), [Kingfisher](https://github.com/onevcat/Kingfisher), [Nuke](https://github.com/kean/Nuke)
- Combine: https://www.vadimbulavin.com/asynchronous-swiftui-image-loading-from-url-with-combine-and-swift/

```swift

protocol ImageDownloaderDelegate: class {
    func imageDownloader(_ imageDownloader: ImageDownloader, didDownload image: UIImage, context: [String: Any])
    func imageDownloader(_ imageDownloader: ImageDownloader, didFail error: Error?, context: [String: Any])
}

class ImageDownloader {
    
    init(delegate: ImageDownloaderDelegate?) {
        self.delegate = delegate
    }
    
    weak var delegate: ImageDownloaderDelegate?
    var tasks = [String: URLSessionTask]()
    let imageCache = NSCache<AnyObject, AnyObject>()
    
    func fetchCachedOrDownload(url: URL, context: [String: Any]) -> UIImage? {
        
        // Check Cache
        let absoluteString = url.absoluteString
        if let cached = imageCache.object(forKey: absoluteString as AnyObject) as? UIImage {
            return cached
        }
        
        guard tasks[absoluteString] == nil else {
            // We're already downloading the image.
            return nil
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            DispatchQueue.main.async {
                
                if let data = data, let image = UIImage(data: data) {
                    self.imageCache.setObject(image, forKey: absoluteString as AnyObject)
                    self.delegate?.imageDownloader(self, didDownload: image, context: context)
                }
                else {
                    self.delegate?.imageDownloader(self, didFail: error, context: context)
                }
            }
        }
        task.resume()
        tasks[absoluteString] = task
        return nil
    }
    
    func cancelDownloadingImage(url: URL) {
        let absoluteString = url.absoluteString
        if let task = tasks[absoluteString] {
            task.cancel()
            tasks[absoluteString] = nil
        }
    }
}
```


## Misc

- Promises: [PromiseKit](https://github.com/mxcl/PromiseKit#documentation)
- Reactive: [RxSwift](https://github.com/ReactiveX/RxSwift)
- Book: [iOS Apps with REST APIs](https://pragprog.com/book/d-cmrest/ios-apps-with-rest-apis)
