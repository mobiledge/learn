---
title: Textdisplayfonts
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

# Text Display and Fonts

- [Documentation > UIKit > Text Display and Fonts](https://developer.apple.com/documentation/uikit/text_display_and_fonts)
- [UIFontTextStyle](https://developer.apple.com/documentation/uikit/uifonttextstyle)

```swift
let styles: [UIFontTextStyle] = [.title1, .title2, .title3, .headline, .subheadline, .body, .callout, .footnote, .caption1, .caption2]
let fonts = styles.map { UIFont.preferredFont(forTextStyle: $0) }
print(fonts.map { $0.fontName + " \($0.pointSize)" })

[".SFUIDisplay-Light 28.0", ".SFUIDisplay 22.0", ".SFUIDisplay 20.0", ".SFUIText-Semibold 17.0", ".SFUIText 15.0", ".SFUIText 17.0", ".SFUIText 16.0", ".SFUIText 13.0", ".SFUIText 12.0", ".SFUIText 11.0"]
```
