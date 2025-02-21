---
title: Viewsandcontrols
parent: iOS
---

1. TOC
{:toc}
# Views and Controls

[Developer Documentation](https://developer.apple.com/documentation) >
[UIKit](https://developer.apple.com/documentation/uikit) >
[Views and controls](https://developer.apple.com/documentation/uikit/views_and_controls)

## Table of Contents
- [Autolayout](#autolayout)
- [Custom Controls](#custom-controls)

#### Autolayout

```swift
func setup() {
  self.addSubview(self.titleLabel)
  self.setupConstraints()
}
func setupConstraints() {
  self.titleLabel.translatesAutoresizingMaskIntoConstraints = false
  let titleLabelConstraints = [
    self.titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor),
    self.titleLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor),
    self.titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
    self.titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
  ]
  NSLayoutConstraint.activate(titleLabelConstraints)
}
```

#### Custom Controls
- [Implement a Custom Control - developer.apple.com](https://developer.apple.com/library/archive/referencelibrary/GettingStarted/DevelopiOSAppsSwift/ImplementingACustomControl.html)
- [Custom Control Example - mergesort/Slope](https://github.com/mergesort/Slope#lets-build-the-save-button-above)
