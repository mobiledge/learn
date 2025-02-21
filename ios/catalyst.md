# Mac Catalyst

[Documentation](https://developer.apple.com/documentation) > 
App Frameworks > 
[UIKit](https://developer.apple.com/documentation/uikit) > 
App Structure > 
[Mac Catalyst](https://developer.apple.com/documentation/uikit/mac_catalyst)


## Code

```swift
func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
    ...
    splitViewController.delegate = self

    #if targetEnvironment(macCatalyst)

    // https://developer.apple.com/documentation/uikit/mac_catalyst/optimizing_your_ipad_app_for_mac
    // Add a translucent background to the primary view controller.
    splitViewController.primaryBackgroundStyle = .sidebar

    // https://developer.apple.com/documentation/uikit/mac_catalyst/removing_the_title_bar_in_your_mac_app_built_with_mac_catalyst
    // Removing the Title Bar in Your Mac App Built with Mac Catalyst
    guard let windowScene = (scene as? UIWindowScene) else { return }
    if let titlebar = windowScene.titlebar {
        titlebar.titleVisibility = .hidden
        titlebar.toolbar = nil
    }
    #endif
}
```

## Topics

#### Drag & Drop

#### Multiple Windows

## WWDC

###### [What's New in iOS Design](https://developer.apple.com/videos/play/wwdc2019/808)
- Dark mode
- Modal presentations
- Contextual menus


###### [Modernizing Your UI for iOS 13](https://developer.apple.com/videos/play/wwdc2019/224)
- Flexible UI
- Bars
- Presentations
- Search
- Gestures
- Menus


###### [Introducing iPad Apps for Mac](https://developer.apple.com/videos/play/wwdc2019/205)
- When (and when not) to consider this
- Demo: `if targetEnvironment(UIKitForMac)... #endif`
- Demo: icons for Mac
- Things you get for free
- Features to adopt
- Demo: custom Menu item (in place of UIKit gesture)


###### Designing iPad Apps for Mac
###### Taking iPad Apps for Mac to the Next Level
