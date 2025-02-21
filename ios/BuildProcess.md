---
title: Buildprocess
parent: iOS
---

1. TOC
{:toc}
# Build Process

`swiftc` is the Swift compiler. It takes one or more Swift source files as input and produces a binary output that can be executed directly.

`swift` is the Swift interpreter. It reads Swift source code from standard input or from a file and executes it without first compiling it to an executable. 

`swift` interpreter uses the `swiftc` compiler internally to compile and execute Swift code.

```zsh
which swiftc  #/usr/bin/swiftc
which swift   #/usr/bin/swift
```

`/usr/bin/swift` simply forwards commands to the active Xcode toolchain.

```zsh
% xcrun --find swift
  # /Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/bin/swift
```

Determining Swift version
```zsh
swift --version
xcrun swift --version
```

#### Using the `swift` interpreter:
```zsh
echo "print(\"Hello World\")" > test.swift  #creates a new file 'test.swift'
swift test                                  #prints 'Hello World'
```

```zsh
swift -v test.swift
  # invokes .../Xcode.app/.../usr/bin/swift-frontend with a bunch of params
  # prints 'Hello World'
```



#### Using the `swiftc` compiler:
```zsh
echo "print(\"Hello World\")" > test.swift  #creates a new file 'test.swift'
swiftc test.swift                           #creates a new executable 'test'
./test                                      #prints 'Hello World'
```



Compiler flag: `-o` specifies the output file name:
```zsh
swiftc test1.swift -o app  #creates a new executable 'app'
```

Compiler flag: `-v` displays verbose output:
```zsh
swiftc -v test1.swift
  # involes .../Xcode.app/.../swift-frontend with a bunch of params
  # creates a new executable `test1`
```

Multiple files:
```zsh
swiftc file1.swift file2.swift -o app
```
- order doesn't matter

#### Building Faster in Xcode · WWDC18
- Notes: https://www.wwdcnotes.com/notes/wwdc18/408/

#### [The Swift compiler for beginners](https://theswiftdev.com/the-swift-compiler-for-beginners/)

```zsh
% swiftc main.swift     # Produces a new `main` executable file (Kind: Unix Executable File).
% ./main                # Runs the `main` executable, prints "Hello world!".
```

Multiple files
```zsh
% swiftc point.swift main.swift -o point-app    
% ./point-app             # prints: Hello world! 4 20
```

Verbose
```zsh
% swiftc -v point.swift main.swift -o point-app && ./point-app

# /.../swift \
#   -frontend \
#   -c \
#   -primary-file point.swift main.swift \
#   ...
#   -o /.../point-xx.o

# /.../swift \
#   -frontend \
#   -c point.swift \
#   -primary-file main.swift \
#   ...
#   -o /T/main-xxxx.o

# /.../ld \
#   /.../point-xxxx.o \
#   /.../main-xxxx.o \
#   ...
#   -o point-app
```
