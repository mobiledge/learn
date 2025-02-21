---
title: Text
parent: iOS
---

1. TOC
{:toc}
# Text

[Adding a Custom Font to Your App](https://developer.apple.com/documentation/uikit/text_display_and_fonts/adding_a_custom_font_to_your_app)

#### Fonts and Font Descriptors

```swift
func printAllFonts() {
  let familyNames = UIFont.familyNames
  let fontNames = familyNames.flatMap {UIFont.fontNames(forFamilyName: $0)}
  let sorted = fontNames.sorted()
  sorted.forEach({ print($0) })
}
```

#### Styles

```swift
let styles: [UIFontTextStyle] = [.title1, .title2, .title3, .headline, .subheadline, .body, .callout, .footnote, .caption1, .caption2]
let fonts = styles.map { UIFont.preferredFont(forTextStyle: $0) }
print(fonts.map { $0.fontName + " \($0.pointSize)" })

[".SFUIDisplay-Light 28.0", ".SFUIDisplay 22.0", ".SFUIDisplay 20.0", ".SFUIText-Semibold 17.0", ".SFUIText 15.0", ".SFUIText 17.0", ".SFUIText 16.0", ".SFUIText 13.0", ".SFUIText 12.0", ".SFUIText 11.0"]
```
