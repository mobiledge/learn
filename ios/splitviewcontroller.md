---
title: Splitviewcontroller
parent: iOS
---

1. TOC
{:toc}
# Split View Controller

[Multiple UISplitViewController Tutorial](https://www.raywenderlich.com/7212-multiple-uisplitviewcontroller-tutorial)


#### Hide Master on Selection
```swift
// MARK: - Selection
override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    // Hides Master on Selection
    // https://stackoverflow.com/a/27399688/12940679
    let button = splitViewController?.displayModeButtonItem
    if let action = button?.action, let target = button?.target {
        UIApplication.shared.sendAction(action, to: target, from: nil, for: nil)
    }
}
```
