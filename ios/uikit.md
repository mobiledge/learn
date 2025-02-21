---
title: Uikit
parent: iOS
---

1. TOC
{:toc}
# UIKit

- [Catalyst](https://github.com/mobilege/ios-development/blob/master/catalyst.md#mac-catalyst)
- https://developer.microsoft.com/en-us/fluentui#/

## Topics
*based on [Programming iOS 12 - Matt Neuburg](https://learning.oreilly.com/library/view/programming-ios-12/9781492044628/)*
- Views: 
Views, 
Drawing, 
Layers, 
Animation
- Interface: 
[View Controllers](https://github.com/mobilege/ios-development/blob/master/view-controllers.md), 
[Table Views](https://github.com/mobilege/ios-development/blob/master/tableviews.md), 
[Collection Views](https://github.com/mobilege/ios-development/blob/master/collection-views.md), 
[Navigation Controllers](https://github.com/mobilege/ios-development/blob/master/navigation-controllers.md),
[Split View Controller](https://github.com/mobilege/ios-development/blob/master/splitviewcontroller.md), 
[Text & Font](https://github.com/mobilege/ios-development/blob/master/text.md),
[Images](https://github.com/mobilege/ios-development/blob/master/image-persistence.md)


```swift
// MARK: - View Controller Containment
    
var contentController: UIViewController?
@IBOutlet weak var containerView: UIView!

func displayContentController(_ vc: UIViewController) {
    if let oldVC = contentController {
        hideContentController(oldVC)
    }
    addChildViewController(vc)
    vc.view.frame = containerView.bounds
    vc.view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    containerView.addSubview(vc.view)
    vc.didMove(toParentViewController: self)
    contentController = vc
}

func hideContentController(_ vc: UIViewController) {
    vc.willMove(toParentViewController: nil)
    vc.view.removeFromSuperview()
    vc.removeFromParentViewController()
}
```


#### [Text Display and Fonts](https://developer.apple.com/documentation/uikit/text_display_and_fonts)

##### [UIFontTextStyle](https://developer.apple.com/documentation/uikit/uifonttextstyle)

```swift
let styles: [UIFontTextStyle] = [.title1, .title2, .title3, .headline, .subheadline, .body, .callout, .footnote, .caption1, .caption2]
let fonts = styles.map { UIFont.preferredFont(forTextStyle: $0) }
print(fonts.map { $0.fontName + " \($0.pointSize)" })

[".SFUIDisplay-Light 28.0", ".SFUIDisplay 22.0", ".SFUIDisplay 20.0", ".SFUIText-Semibold 17.0", ".SFUIText 15.0", ".SFUIText 17.0", ".SFUIText 16.0", ".SFUIText 13.0", ".SFUIText 12.0", ".SFUIText 11.0"]
```


## Table View Controllers

Book: [8. Table Views and Collection Views](https://www.safaribooksonline.com/library/view/programming-ios-11/9781491999219/)



## Collection View Controllers

Book: [8. Table Views and Collection Views](https://www.safaribooksonline.com/library/view/programming-ios-11/9781491999219/)

Guide: [Collection View Programming Guide for iOS](https://developer.apple.com/library/content/documentation/WindowsViews/Conceptual/CollectionViewPGforIOS/Introduction/Introduction.html)




## Misc 

##### Code Generation

[pinterest/plank](https://github.com/pinterest/plank)

##### Data Validation

Class: [CharacterSet](https://developer.apple.com/documentation/foundation/characterset)

Lib: [adamwaite/Validator](https://github.com/adamwaite/Validator) 

[Template:General_Category](https://en.wikipedia.org/wiki/Template:General_Category_(Unicode))

[Unicode Character Categories](http://www.fileformat.info/info/unicode/category/index.htm)


##### Material Design

[Material Components Catalog](https://material.io/components/ios/catalog/)

Lib: [material-components/material-components-ios](https://github.com/material-components/material-components-ios)

* [TextFields](https://github.com/material-components/material-components-ios/tree/develop/components/TextFields#examples---single-line)


##### UI Frameworks

[PaoloCuscela/Cards](https://github.com/PaoloCuscela/Cards)
