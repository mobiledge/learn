[mobilege](https://github.com/mobilege/mobilege.github.io/blob/master/README.md) / 
[iOS](https://github.com/mobilege/ios-development/blob/master/README.md) /

# Localization

## [Localization](https://developer.apple.com/documentation/xcode/localization)

- Localization vs Internationalization_
- Xcode 15 (iOS 17, 2023) and later: **string catalogs**. Earlier versions: **stringsdict files**

![localiztaion-templates](/images/localization-templates.png)

## [Supporting multiple languages in your app](https://developer.apple.com/documentation/xcode/supporting-multiple-languages-in-your-app)

- User-facing text
- Dates, currencies, and numbers (DateFormatter, NumberFormatter etc)
- Pluralization
- Device type
- Grammatical agreement (gender)
- Text direction
- Tall languages (Arabic, Hindi, and Thai)
- Sounds, images and assets.

## [Localizing and varying text with a string catalog](https://developer.apple.com/documentation/xcode/localizing-and-varying-text-with-a-string-catalog)

- Default name is Localizable.xcstrings (extension hidden in Xcode)
  ```
  {
    "sourceLanguage" : "en",
    "strings" : {
      "Hello" : {
  
      }
    },
    "version" : "1.0"
  }
  ```
- Building the project automatically adds entries for all text (string literals)
- Preview Macros
  ```swift
    #Preview {
      ContentView()
          .environment(\.locale, Locale(identifier: "fr"))
  }
  ```
