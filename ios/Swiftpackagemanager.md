---
title: Swiftpackagemanager
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

# Swift Package Manager

#### [Swift Package Manager basics](https://theswiftdev.com/swift-package-manager-tutorial/)

```zsh
% swift package init --type executable

# Creates:
#   .gitignore
#   Package.swift
#   README.md
#   Sources/spm/main.swift
#   Tests/spmTests/spmTests.swift

% swift build

# Creates
#   .build/...

% swift run spm

# Hello, world!
```

```zsh
% swift package init

# Creating library package: mylib (named after the containing folder)
# Creating Package.swift
# Creating README.md
# Creating .gitignore
# Creating Sources/mylib/mylib.swift
# Creating Tests/mylibTests/mylibTests.swift

% swift test
```

#### [Creating a command line tool using the Swift Package Manager](https://www.avanderlee.com/swift/command-line-tool-package-manager/)
