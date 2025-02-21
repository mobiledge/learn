---
title: Navigationcontrollers
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

# Navigation Controllers

- [Customizing Your App’s Navigation Bar](https://developer.apple.com/documentation/uikit/uinavigationcontroller/customizing_your_app_s_navigation_bar) - Sample Code

 - [The navigation bar and back title - iOS Development Tips Weekly](https://www.lynda.com/iOS-tutorials/navigation-bar-back-title/633856/750767-4.html)

## Code

```swift

func configureAppearence() {

  let appearance = UINavigationBarAppearance()
  appearance.backgroundColor = .cornflowerBlue
  appearance.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Lobster-Regular", size: 20)!]
  appearance.largeTitleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "Lobster-Regular", size: 36)!]
  appearance.backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "OpenSans-SemiBold", size: 16)!]
  appearance.backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "OpenSans-SemiBold", size: 16)!]

  let backButtonAppearance = UIBarButtonItemAppearance()
  backButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "OpenSans-Regular", size: 16)!]
  backButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "OpenSans-Regular", size: 16)!]
  appearance.backButtonAppearance = backButtonAppearance

  let plainButtonAppearance = UIBarButtonItemAppearance()
  plainButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "OpenSans-Regular", size: 16)!]
  plainButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "OpenSans-Regular", size: 16)!]
  appearance.buttonAppearance = plainButtonAppearance

  let doneButtonAppearance = UIBarButtonItemAppearance()
  doneButtonAppearance.normal.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "OpenSans-SemiBold", size: 16)!]
  doneButtonAppearance.highlighted.titleTextAttributes = [.foregroundColor: UIColor.white, .font: UIFont(name: "OpenSans-SemiBold", size: 16)!]
  appearance.doneButtonAppearance = doneButtonAppearance

  UINavigationBar.appearance().compactAppearance = appearance
  UINavigationBar.appearance().standardAppearance = appearance
  UINavigationBar.appearance().scrollEdgeAppearance = appearance

  // Needed for the back indicator arrow image
  let buttonItemAppearance = UIBarButtonItem.appearance(whenContainedInInstancesOf: [UINavigationBar.self])
  buttonItemAppearance.tintColor = UIColor.white        
}

```

