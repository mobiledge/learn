---
title: Userdefaultspersistable
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

---
title: Userdefaultspersistable
parent: iOS
---

1. TOC
{:toc}
import UIKit

protocol UserDefaultsPersistable: Codable {
    
    static var userDefaultsKey: String { get }
    func save()
    static func fetch() -> Self?
}

extension UserDefaultsPersistable {
    
    static var userDefaultsKey: String {
        return String(describing: self)
    }
    
    func save() {
        UserDefaultsPersistenceManager.shared.save(self, key: Self.userDefaultsKey)
    }
    
    static func fetch() -> Self? {
        return UserDefaultsPersistenceManager.shared.fetch(key: Self.userDefaultsKey)
    }
}


class UserDefaultsPersistenceManager {
    
    static var shared = UserDefaultsPersistenceManager()
    
    func save<T: Encodable>(_ obj: T, key: String) {
        do {
            let data = try JSONEncoder().encode(obj)
            let dict = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
            UserDefaults.standard.setValue(dict, forKey: key)
        }
        catch {
            print(error)
        }
    }
    
    func fetch<T: Decodable>(key: String) -> T? {
        do {
            guard let dict = UserDefaults.standard.value(forKey: key) else { return nil }
            let data = try JSONSerialization.data(withJSONObject: dict, options: .prettyPrinted)
            let item = try JSONDecoder().decode(T.self, from: data)
            return item
        }
        catch {
            print(error)
            return nil
        }
    }

}
