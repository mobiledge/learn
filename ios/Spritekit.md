---
title: Spritekit
parent: iOS
---

## Table of contents
{: .no_toc .text-delta }

1. TOC
{:toc}

<!--- Everything above this is generated --->

# SpriteKit

## 2D Apple Games by Tutorials
- [x] Chapter 1. Sprites
- [x] Chapter 2: Manual Movement
- [x] Chapter 3: Actions

## Code Snippets

```swift
class GameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            let scene = GameScene(size: self.view.frame.size)
            scene.scaleMode = .aspectFill
            view.presentScene(scene)
            view.ignoresSiblingOrder = true
            view.showsFPS = true
            view.showsNodeCount = true
        }
    }
}
```

```swift
class GameScene: SKScene {
    
    override func didMove(to view: SKView) {

        let node = SKShapeNode(rectOf: CGSize(width: 100.0, height: 100.0))
        node.position = CGPoint(x: size.width/2.0, y: size.height/2.0)
        addChild(node)
    }
}
```
