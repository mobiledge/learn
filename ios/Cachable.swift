---
title: Cachable
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

---
title: Cachable
parent: iOS
---

1. TOC
{:toc}
protocol Cachable: Codable {
   
    // Names
    static var cacheFolderName: String { get }
    var cacheFileName: String { get }
    
    // URLs
    static var cacheFolderURL: URL? { get }
    var cacheFileURL: URL? { get }
    
    // Persistence
    func writeToCache()
    static func retrieveAllFromCache() -> [Self]
    static func deleteAllFromCache()
}

extension Cachable {
    
    // URLs
    static var cacheFolderURL: URL? {
        let cm = CacheManager.shared
        guard let documentDirectoryURL = cm.documentDirectoryURL() else { return nil }
        let folderURL = documentDirectoryURL.appendingPathComponent(self.cacheFolderName)
        return folderURL
    }
    
    var cacheFileURL: URL? {
        guard let folderURL = Self.cacheFolderURL else { return nil }
        let fileURL = folderURL.appendingPathComponent(self.cacheFileName)
        return fileURL
    }
    
    // Persistence
    func writeToCache() {
        guard let fileURL  = self.cacheFileURL else { return }
        let cm = CacheManager.shared
        cm.write(encodable: self, toURL: fileURL)
    }

    static func retrieveAllFromCache() -> [Self] {
        guard let folderURL  = self.cacheFolderURL else { return [Self]() }
        let cm = CacheManager.shared
        let arr: [Self] = cm.retrieve(fromURL: folderURL)
        return arr
    }
    
    static func deleteAllFromCache() {
        //todo
    }
}

class CacheManager {
    
    static let shared = CacheManager()
    let fm = FileManager.default

    /*
     MARK: - Write & Retrieve JSON Encoded Objects
     */
    func write<T: Encodable>(encodable: T, toURL URL: URL) {
        do {
            let data = try JSONEncoder().encode(encodable)
            write(data: data, toURL: URL)
        }
        catch {
            print(error)
        }
    }
    
    func retrieve<T: Decodable>(fromURL URL: URL) -> [T] {
        
        let dataArr: [Data] = contentsOfDirectory(url: URL)
        
        let objArr = dataArr.compactMap({ data -> T? in
            do {
                let obj = try JSONDecoder().decode(T.self, from: data)
                return obj
            }
            catch {
                print(error)
            }
            return nil
        })
        return objArr
    }
    
    /*
     MARK: - Write Methods
     */
    func write(data: Data, toURL URL: URL) {
        do {
            try data.write(to: URL)
            print("Cached at: \(URL)")
        }
        catch {
            print(error)
        }
    }

    /*
     MARK: - Retrieve Methods
     */
    func contentsOfDirectory(url: URL) -> [Data] {
        
        let urlArr: [URL] = contentsOfDirectory(url: url)
        let data = urlArr.compactMap({ url -> Data? in
            do {
                let data = try Data(contentsOf: url)
                return data
            }
            catch {
                print(error)
            }
            return nil
        })
        return data
    }
    
    func contentsOfDirectory(url: URL) -> [URL] {
        do {
            let urlArr = try fm.contentsOfDirectory(at: url, includingPropertiesForKeys: nil)
            return urlArr
        }
        catch {
            print(error)
        }
        return [URL]()
    }
    
    /*
     MARK: - Helper Methods
     */
    func ensureFolderExists(folderURL: URL) {
        
        var isDir: ObjCBool = false
        if fm.fileExists(atPath: folderURL.path, isDirectory: &isDir) {
            if isDir.boolValue {
                return
            }
            try? fm.removeItem(at: folderURL)
        }
        try? fm.createDirectory(at: folderURL, withIntermediateDirectories: false, attributes: nil)
    }
    
    func documentDirectoryURL() -> URL? {
        do {
            let fm = FileManager.default
            let URL = try fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            return URL
        }
        catch {
            print(error)
        }
        return nil
    }
}
