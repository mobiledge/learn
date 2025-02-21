---
title: Swiftuilegacy
parent: iOS
---

1. TOC
{:toc}
# SwiftUI (Legacy Page)

## [**Learning path > iOS User Interfaces with SwiftUI**](https://www.kodeco.com/ios/paths/iosuserinterface)

#### NavigationView
- `NavigationView` is deprecated
- Documentation / SwiftUI / Navigation / [NavigationView](https://developer.apple.com/documentation/swiftui/navigationview)

#### NavigationStack
- Introduced in iOS 16 (2022)
- Documentation / SwiftUI / Navigation / [NavigationStack](https://developer.apple.com/documentation/swiftui/navigationstack)

#### Sheet
- Documentation / SwiftUI / Modal presentations / [sheet(isPresented:onDismiss:content:)](https://developer.apple.com/documentation/swiftui/view/sheet(ispresented:ondismiss:content:))

#### Lists
- Documentation / SwiftUI / Lists / [List](https://developer.apple.com/documentation/swiftui/list)
- Selection
- Refreshing
- Sections
- Creating hierarchical lists
- Styling lists

#### UIHostingController

```swift
class SecondViewHostingController: UIHostingController<SecondView> {
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder, rootView: SecondView())
	}
}
```
source: https://sarunw.com/posts/custom-uihostingcontroller/


## WWDC 20

#### [Introduction to SwiftUI](https://developer.apple.com/videos/all-videos/?q=introduction%20to%20swift)

#### [What's new in SwiftUI](https://developer.apple.com/videos/play/wwdc2020/10041/)
- Apps & Widgets
- Lists & Collections
- Toolbars & Controls
- New Effects & Styling
- System Integration

#### [Stacks, Grids, and Outlines in SwiftUI](https://developer.apple.com/videos/play/wwdc2020/10031/)
- Stacks
- Grids
- Lists
- Outlines



## WWDC 19

#### 101 - Keynote
#### 103 - Platforms State of the Union
#### 402 - What's New in Swift
- ABI & Module stability 
  - *ABI (application binary interface) Stability? Runtime included in OS (instead of app bundle)* 
  - *Module Stability?*
  - *see: [ABI Stability and More](https://swift.org/blog/abi-stability-and-more/)* 
 - Performance
 - Code size reductions
 - Faster bridging bhetween Swift & Objective-C
 - String
   - *see: [UTF-8 String](https://swift.org/blog/utf8-string/)*
 - Language & Standard Library
   - implicit `return`
   - initializer default values
   - SIMD vector library
   - redesigned string interpolation
   - opaque return type, `some`
   - property wrappers
   - embedded DSLs

See: [The Swift 5.1 features that power SwiftUI’s API](https://www.swiftbysundell.com/posts/the-swift-51-features-that-power-swiftuis-api)

## SwiftUI

![SwiftUI Sessions](https://github.com/mobilege/ios-development/blob/master/images/swiftui-sessions.png)

#### 204 - Introducing SwiftUI: Building Your First App

#### 216 - Swift UI Essentials
###### Getting started: Views and modifiers

```swift
VStack {
  Text("Avocado Toast").font(.title)
  Toggle(isOn: $order.includeSalt) {
    Text("Include Salt")
  }
  Stepper(value: $order.quantity, in: 1...10) {
    Text("Quantity: \(order.quantity)")
  }
  Button(action: submitOrder) {
    Text("Order")
  }
}

//VStack API
public struct VStack<Content : View> : View { 
  public init(
    alignment: HorizontalAlignment = .center,
    spacing: Length? = nil,
    @ViewBuilder content: () -> Content
  )
}
```

```swift
//Binding Syntax
struct OrderForm : View {
  @State private var order: Order
  var body: some View {
    Stepper(value: $order.quantity, in: 1...10) {
      Text("Quantity: \(order.quantity)") 
    }
  } 
}
struct Order {
  var includeSalt: Bool
  var includeRedPepperFlakes: Bool 
  var quantity: Int
}
```

```swift
//Sharing Modifiers
VStack(alignment: .leading) {
  Toggle(isOn: $order.includeSalt) { ... }
  Stepper(value: $order.quantity, in: 1...10) { ... }
  Button(action: submitOrder) { ... }
}
.opacity(0.5)
```

###### Building custom views 19.25

```swift
//List
struct OrderHistory : View {
let previousOrders: [CompletedOrder]

var body: some View {
  List(previousOrders) { order in
    OrderCell(order: order)
  }
}

struct OrderCell : View {
  var order: CompletedOrder

  var body: some View {
    HStack {
      VStack(alignment: .leading) {
      Text(order.summary)
      Text(order.purchaseDate)
        .font(.subheadline)
        .foregroundColor(.secondary)
      }
      Spacer()
      ForEach(order.toppings) { topping in
        ToppingIcon(topping)
      }
    }
  } 
}
```

###### Composing controls 33.20
```swift
//Button
Button(action: submitOrder) { 
  Text("Order")
}

//Button API
public struct Button<Label : View> : View { 
  public init(
    action: @escaping () -> Void,
    @ViewBuilder label: () -> Label 
  )
}
```

```swift
Toggle(isOn: $order.includeSalt) {
  Text("Include Salt")
}
```

```swift
Picker(selection: $order.spread, label: Text("Spread")) {
  ForEach(Spread.allCases) { spread in
    Text(spread.name).tag(spread)
  }
}

enum Spread : CaseIterable, Hashable, Identifiable {
  case none
  case almondButter 
  case peanutButter
  case honey
}
``` 

```swift
//Environment
@Environment(\.isEnabled) private var isEnabled: Bool
```


###### Navigating your app 51.50


#### Data Flow Through SwiftUI
###### Working With External Data | 81/122 | 17:45


#### Building Custom Views with SwiftUI




## Combine & Networking

#### 721 - Combine in Practice

#### 722 - Introducing Combine

#### 712 - Advances in Networking, Part 1
- low data mode
- Combine in URLSession
- websocket
- mobility improvements


## Other

#### 224 - Modernizing Your UI for iOS 13
- flexible UI
- bars
- presentation
- search
- gestures
- menus


## Code Snippets

#### Picker
```swift
let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]

Picker("Genre", selection: $genre) {
  ForEach(genres, id: \.self) {
    Text($0)
  }
}
```

#### Form
```swift
Form {
  Section {
      TextField("Name of book", text: $title)
      TextField("Author's name", text: $author)

      Picker("Genre", selection: $genre) {
          ForEach(genres, id: \.self) {
              Text($0)
          }
      }
  }

  Section {
      Picker("Rating", selection: $rating) {
          ForEach(0..<6) {
              Text("\($0)")
          }
      }

      TextField("Write a review", text: $review)
  }

  Section {
      Button("Save") {
          // add the book
      }
  }
}
```
*Source: https://www.hackingwithswift.com/books/ios-swiftui/creating-books-with-core-data*

#### SwiftUI in UIKit

```swift
class SecondViewHostingController: UIHostingController<SecondView> {
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder, rootView: SecondView())
	}
}
```
*Source: https://sarunw.com/posts/custom-uihostingcontroller*

#### Core Data

```swift
//Environment
@Environment(\.managedObjectContext) var moc

//FetchRequest
@FetchRequest(entity: Book.entity(), sortDescriptors: []) var books: FetchedResults<Book>

//Save
let newBook = Book(context: self.moc)
newBook.title = self.title
newBook.author = self.author
newBook.rating = Int16(self.rating)
try? self.moc.save()

//List
var body: some View {
  VStack {
    List {
      ForEach(students, id: \.id) { student in
        Text(student.name ?? "Unknown")
      }
    }
  }
}
```
*Source: https://www.hackingwithswift.com/books/ios-swiftui/creating-books-with-core-data*





## Legacy

**Quicklinks**
- [Documentation](https://developer.apple.com/documentation) > 
[SwiftUI](https://developer.apple.com/documentation/swiftui) > 
[SwiftUI Tutorials](https://developer.apple.com/tutorials/swiftui/tutorials)
- [hackingwithswift.com](https://www.hackingwithswift.com/) > 
[SwiftUI by Example](https://www.hackingwithswift.com/quick-start/swiftui)
- [hackingwithswift.com](https://www.hackingwithswift.com/) > 
[SwiftUI Projects](https://www.hackingwithswift.com/books/ios-swiftui)
- [Gosh Darn SwiftUI](https://goshdarnswiftui.com/)
- [The Complete SwiftUI Documentation You’ve Been Waiting For](https://medium.com/better-programming/the-complete-swiftui-documentation-youve-been-waiting-for-fdfe7241add9)
- [Code Snippets](#code-snippets)


#### Views and Controls
[Documentation](https://developer.apple.com/documentation) > 
Framework [SwiftUI](https://developer.apple.com/documentation/swiftui) > 
[Views and Controls](https://developer.apple.com/documentation/swiftui/views_and_controls) > 
Protocol [View](https://developer.apple.com/documentation/swiftui/view) > 
[Styling](https://developer.apple.com/documentation/swiftui/view/styling) > 
[View Styles](https://developer.apple.com/documentation/swiftui/view/styling/view_styles)

###### TextField Formatting
- [Tip Calculator in SwiftUI - NSScreencast](https://nsscreencast.com/episodes/397-swiftui-tip-calculator)

###### List
- [List Selection](https://forums.swift.org/t/highlight-row-in-swiftui-sidebar/30702/7)

#### View Layout and Presentation

###### Navigation
- [Double Column Navigation View Style](https://stackoverflow.com/a/57215664)

###### Modal Presentation
- [Presenting a modal sheet - Jan Codes](https://blog.kaltoun.cz/swiftui-presenting-modal-sheet/)
- [Modal presentation - Erica Sadun](https://ericasadun.com/2019/06/16/swiftui-modal-presentation/)


#### Previews
- [previewDevice(_:)](https://developer.apple.com/documentation/swiftui/securefield/3289399-previewdevice)
- [SwiftUI Previews on macOS Catalina and Xcode 11](https://nshipster.com/swiftui-previews/)


## Book: SwiftUI by Tutorials
- [x] Chapter 1: Introduction
- [x] Chapter 2: Getting Started
- [x] Chapter 3: Understanding SwiftUI
- [x] Chapter 4: Integrating SwiftUI
- [x] Chapter 5: The Apple Ecosystem
- [x] Chapter 6: Intro to Controls: Text & Image
- [x] Chapter 7: State & Data Flow
- [x] Chapter 8: Controls & User Input
- [ ] Chapter 9: Introducing Stacks and Containers *(see: WWDC 2019: Building Custom Views with SwiftUI)*
- [x] Chapter 10: Lists & Navigation *(see: [WWDC 2019 SwiftUI Essentials](https://developer.apple.com/videos/play/wwdc2019/216/))*
- [x] Chapter 11: Testing and Debugging
- [ ] Chapter 12: Handling User Input

*next: Testing multiple platforms*

## Resources
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

<p align="center"><a href="#contents">⇧ Back to Top ⇧</a></p>

## Shortcuts
- cmd + click on code to embed in VStack/HStack
- ctr + opt + click on canvas to reveal property inspector

<p align="center"><a href="#contents">⇧ Back to Top ⇧</a></p>
