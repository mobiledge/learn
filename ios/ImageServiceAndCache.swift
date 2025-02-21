class ImageService {
    
    static var shared = ImageService()
    
    func prefetchAndCache(url: URL) {
        URLSession.shared.dataTask(with: url) {(data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                ImageCache.shared.cacheImage(image: image, forURL: url)
            }
            }.resume()
    }
    
    @discardableResult
    func fetchImage(url: URL,
                    context: Any? = nil,
                    completion: @escaping (UIImage?, Any?, Error?) -> Void) -> URLSessionDataTask {
        
        let task = URLSession.shared.dataTask(with: url) {(data, response, error) in
            
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    completion(image, context, nil)
                }
            }
            else {
                DispatchQueue.main.async {
                    completion(nil, context, error)
                }
            }
        }
        task.resume()
        return task
    }
    
    func cancelDownloadingImage(url: URL) {}
    
    func cancelAllTasks() {}
    
}

class ImageCache {
    
    static var shared = ImageCache()
    
    let cache: NSCache<NSString, UIImage> = {
        let cache = NSCache<NSString, UIImage>()
        cache.countLimit = 20
        return cache
    }()
    
    func cacheImage(image: UIImage, forURL URL: URL) {
        let key = URL.absoluteString
        cache.setObject(image, forKey: key as NSString)
    }
    
    func cachedImage(forURL URL: URL) -> UIImage? {
        let key = URL.absoluteString
        return cache.object(forKey: key as NSString)
    }
}
