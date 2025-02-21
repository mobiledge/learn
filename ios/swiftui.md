[mobilege](https://github.com/mobilege/mobilege.github.io/blob/master/README.md) / 
[iOS](https://github.com/mobilege/ios-development/blob/master/README.md) /
[**SwiftUI**](https://github.com/mobilege/ios-development/blob/master/swiftui.md) 

# [**SwiftUI**](https://github.com/mobilege/ios-development/blob/master/swiftui.md) &nbsp; &nbsp;

- [Search](http://mobiledge.github.io/search/swiftui-views.html) 🔎 
- [Documentation](https://developer.apple.com/documentation/swiftui/) 
- [Tutorials](https://developer.apple.com/tutorials/app-dev-training/getting-started-with-scrumdinger)
- [Text input and output](https://developer.apple.com/documentation/swiftui/text-input-and-output)
  - [Text ↓](#text) · [`Text`](https://developer.apple.com/documentation/swiftui/text)
  - [Label ↓](#label) · [`Label`](https://developer.apple.com/documentation/swiftui/label)
- [Images](https://developer.apple.com/documentation/swiftui/images)
  - [Image ↓](#image) · [`Image`](https://developer.apple.com/documentation/swiftui/image)
  - [AsyncImage ↓](#asyncimage) · [`AsyncImage`](https://developer.apple.com/documentation/swiftui/asyncimage)
- [Controls and indicators](https://developer.apple.com/documentation/swiftui/controls-and-indicators)
  - [Button ↓](#button) · [`Button`](https://developer.apple.com/documentation/swiftui/button)
  - [Slider ↓](#slider) · [`Slider`](https://developer.apple.com/documentation/swiftui/slider)
- [Notes ↓](#notes)
- [Resources ↓](#resources)
- [Shortcuts ↓](#shortcuts)


## [`Text`](https://developer.apple.com/documentation/swiftui/text)
```swift
Text("Hamlet")
```

#### Styling Modifiers
**`font(_:)`**: Sets the font of the text.
  ```swift
  Text("Hello, World!")
      .font(.largeTitle)
  ```
See Also: [`Font`](#font)
  
**`foregroundColor(_:)`**: Sets the color of the text.
  ```swift
  Text("Hello, World!")
      .foregroundColor(.blue)
  ```
See Also: [`Color`](#color)

## [`Label`](https://developer.apple.com/documentation/swiftui/label)
- [Getting built-in label styles](https://developer.apple.com/documentation/swiftui/labelstyle#Getting-built-in-label-styles)


## [`Image`](https://developer.apple.com/documentation/swiftui/image)
- Documentation / SwiftUI / [Images](https://developer.apple.com/documentation/swiftui/images)
- Documentation / SwiftUI / Images / [**Fitting images into available space**](https://developer.apple.com/documentation/swiftui/fitting-images-into-available-space)

```swift
Image("Landscape")
    .resizable()
    .aspectRatio(contentMode: .fit)
    .frame(width: 200, height: 200)
    .border(Color.blue)
    .clipped()
```

- Documentation / UIKit / Images and PDF / UIImage / [Configuring and displaying symbol images in your UI](https://developer.apple.com/documentation/uikit/uiimage/configuring_and_displaying_symbol_images_in_your_ui)
- [How to use SFSymbol rendering modes in SwiftUI](https://thisdevbrain.com/sfsymbols-rendering-modes/)

## [`AsyncImage`](https://developer.apple.com/documentation/swiftui/asyncimage)

```swift
AsyncImage(url: URL(string: "https://picsum.photos/id/12/200"))

AsyncImage(url: URL(string: "https://picsum.photos/id/12/200")) { image in
    image.resizable()
} placeholder: {
    ProgressView()
}
.frame(width: 80, height: 80)

AsyncImage(url: URL(string: "https://placehold.co/600x400")) { phase in
    if let image = phase.image {
	image // Displays the loaded image.
    } else if let error = phase.error?.localizedDescription {
	Text(error) // Indicates an error.
    } else {
	ProgressView() // Acts as a placeholder.
    }
}
```


## [`Button`](https://developer.apple.com/documentation/swiftui/button)

#### Button Styles
- [Styling buttons](https://developer.apple.com/documentation/swiftui/button#Styling-buttons)
- [Getting built-in button styles](https://developer.apple.com/documentation/swiftui/primitivebuttonstyle#Getting-built-in-button-styles)
- `.accessoryBar`,`.accessoryBarAction` _used in toolbars_
- `.card` _tvOS_
- `.link` _macOS_

<img width="712" alt="button-styles" src="https://github.com/user-attachments/assets/0205b6a7-2019-4605-b6f4-ef3dc39af675" />  


## [`Slider`](https://developer.apple.com/documentation/swiftui/slider)
- _When creating a slider with labels, the label is only used for VoiceOver accessibility and isn't visible._
  
  
## [`Font`](https://developer.apple.com/documentation/swiftui/font)

There are 3 ways of setting fonts on text:

i. [Standard Fonts](https://developer.apple.com/documentation/swiftui/font#Getting-standard-fonts) 
```swift
Text("largeTitle")
    .font(.largeTitle)
```

ii. [System Fonts](https://developer.apple.com/documentation/swiftui/font#Getting-system-fonts)
```swift
Text("regular")
    .font(.system(.body, design: .default, weight: .regular))
```

| `Font.TextStyle` | `Font.Design` | `Font.Weight` |
| ---- | ---- | ---- |
| <img width="541" alt="Screenshot 2023-12-29 at 2 19 37 PM" src="https://github.com/mobiledge/ios-development/assets/6307250/d1bf2ff7-453b-4d1b-91b3-df029660dcc7"> | <img width="572" alt="Screenshot 2023-12-29 at 2 18 24 PM" src="https://github.com/mobiledge/ios-development/assets/6307250/c65c0160-3734-4979-9290-6377d09ec053"> | <img width="552" alt="Screenshot 2023-12-29 at 2 16 54 PM" src="https://github.com/mobiledge/ios-development/assets/6307250/72ac35d2-195f-41cf-a777-db123de58159"> |

Note:
```swift
Text("largeTitle")
    .font(.largeTitle) // .largeTitle is static property on Font struct

// Is the SAME as:

Text("largeTitle")
    .font(.system(.largeTitle)) // .largeTitle is case on TextStyle enum 
```

iii. [Custom Fonts](https://developer.apple.com/documentation/swiftui/font#Creating-custom-fonts)
```swift
```

- Article: [Applying custom fonts to text](https://developer.apple.com/documentation/swiftui/applying-custom-fonts-to-text)

Troubleshooting Notes:
- In the official documentation, the entry added to the Info.plist has the containing folder path. DON'T do this. Simply enter the font file name without the containing folder path.
- See https://codewithchris.com/common-mistakes-with-adding-custom-fonts-to-your-ios-app


## `Color`
- SwiftUI / Drawing and graphics / [Color](https://developer.apple.com/documentation/swiftui/color)
- Human Interface Guidelines / [Color](https://developer.apple.com/design/human-interface-guidelines/color)

#### Creating `Color`
```swift
// i. From Asset Catalog
Color("skyBlue"))

// ii. From Component Values:
Color(red: 0.4627, green: 0.8392, blue: 1.0)
Color(hue: 0.1639, saturation: 1, brightness: 1)
Color(white: 0.4745)

// iii. From UIColor or an NSColor:
Color(uiColor: UIColor.systemBlue)

// iv. From Standard Predefined Colors:
Color.blue
```

#### Appliying `Color`

- Colors are applied using view modifiers
    - `func foregroundStyle<S>(_ style: S) -> some View where S : ShapeStyle`
    - `func backgroundStyle<S>(_ style: S) -> some View where S : ShapeStyle`
    - Color conforms to ShapeStyle (so does Gradient, Material, Shader etc)
- `foregroundColor` is deprecated, use foregroundStyle instead.

```swift
// i. Applying Color to Text
Text("Hello, SwiftUI!")
    .foregroundStyle(Color.blue)

Text("Hello, SwiftUI!")
    .padding()
    .background(Color.yellow)

// ii. Applying Color to Images
Image(systemName: "star.fill")
    .foregroundStyle(Color.yellow)

// iii. Applying Color to Shapes
Circle()
    .fill(Color.green)
    .frame(width: 100, height: 100)

Rectangle()
    .stroke(Color.red, lineWidth: 4)
    .frame(width: 100, height: 100)

// iv. Applying Color to Controls
Button(action: {}) {
    Text("Click Me")
        .padding()
        .background(Color.blue)
        .foregroundStyle(Color.white)
        .cornerRadius(8)
}

Slider(value: .constant(0.5))
    .accentColor(.orange)  // Changes the color of the slider

Toggle(isOn: .constant(true)) {
    Text("Toggle Option")
}
.tint(.purple)  // Tint color for the toggle

// v. Applying Color to Entire View
ZStack {
    Color.gray.ignoresSafeArea()  // Full background color
    Text("Hello, SwiftUI!")
        .foregroundStyle(Color.white)
}
```


## Notes

#### Modifier
- **method** on a View
- changes view's appearence or behaviour (by changing its properties)


## Resources
- [swiftui-legacy.md]()
- [ SwiftUI Documentation](https://developer.apple.com/documentation/swiftui)
- [ Tutorials](https://developer.apple.com/tutorials/swiftui/tutorials)
- [ Sample Apps](https://developer.apple.com/tutorials/sample-apps)
- Data & Storage
  - [The Nested Observables Problem in SwiftUI](https://holyswift.app/how-to-solve-observable-object-problem/)
  - [SwiftUI Data Flow](https://kean.blog/post/swiftui-data-flow)
- Layout
  - swiftbysundell.com > [A guide to the SwiftUI layout system - Part 1](https://www.swiftbysundell.com/articles/swiftui-layout-system-guide-part-1/)
  - kean.blog > [SwiftUI Layout System](https://kean.blog/post/swiftui-layout-system)
  - [GeometryReader to the Rescue](https://swiftui-lab.com/geometryreader-to-the-rescue/)
  - WWDC 19 - [Building Custom Views with SwiftUI](https://developer.apple.com/videos/play/wwdc2019/237/)
- hackingwithswift / [SwiftUI by Example](https://www.hackingwithswift.com/quick-start/swiftui) 
- [Gosh Darn SwiftUI](https://goshdarnswiftui.com/)
- [The Complete SwiftUI Documentation You’ve Been Waiting For](https://medium.com/better-programming/the-complete-swiftui-documentation-youve-been-waiting-for-fdfe7241add9) 
- [swiftui-links.md](https://gist.github.com/indyfromoz/f6428b6313a8a7c5b6faed26d5ab4d2f)
- [Swift Programming for macOS](https://gavinw.me/swift-macos/) `MacOS`

## Shortcuts
- cmd + click on code to embed in VStack/HStack
- ctr + opt + click on canvas to reveal property inspector
