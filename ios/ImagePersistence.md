# Image Persistence

```swift
func fetchImage(id: String) -> UIImage? {
        do {
            let fm = FileManager.default
            let docsurl = try fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let myfolder = docsurl.appendingPathComponent("appimages")
            let file = myfolder.appendingPathComponent("\(id).jpg")

            let imagedata = try Data(contentsOf: file)
            let image = UIImage(data: imagedata)
            return image
        }
        catch {
            debugPrint("Failed to fetch image: \(error.localizedDescription)")
            return nil
        }
    }

    func saveImage(_ image: UIImage, id: String) {
        do {
            // create the folder if it doesn’t exist
            let fm = FileManager.default
            let docsurl = try fm.url(for:.documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
            let myfolder = docsurl.appendingPathComponent("appimages")
            try fm.createDirectory(at:myfolder, withIntermediateDirectories: true)

            // save image to folder
            let data = image.jpegData(compressionQuality: 0.5)
            let file = myfolder.appendingPathComponent("\(id).jpg")
            try data?.write(to: file, options: .atomic)
        }
        catch {
            debugPrint("Failed to save image: \(error.localizedDescription)")
        }
    }
```

```swift
extension UIView {

    func takeScreenshot() -> UIImage? {

        UIGraphicsBeginImageContextWithOptions(self.bounds.size, false, UIScreen.main.scale)

        guard  let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        self.layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}
```
