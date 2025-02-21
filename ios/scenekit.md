---
title: Scenekit
parent: iOS
---

1. TOC
{:toc}
# scenekit

###### [SCNView](https://developer.apple.com/documentation/scenekit/scnview)
###### [SCNScene](https://developer.apple.com/documentation/scenekit/scnscene)
###### [SCNNode](https://developer.apple.com/documentation/scenekit/scnnode)
    
###### [SCNLight](https://developer.apple.com/documentation/scenekit/scnlight), 
###### [SCNCamera](https://developer.apple.com/documentation/scenekit/scncamera), 
###### [SCNGeometry](https://developer.apple.com/documentation/scenekit/scngeometry)
    
Node Transform (relative to parent): The transformation is the combination of the node’s [rotation](https://developer.apple.com/documentation/scenekit/scnnode/1408034-rotation), [position](https://developer.apple.com/documentation/scenekit/scnnode/1408026-position), and [scale](https://developer.apple.com/documentation/scenekit/scnnode/1408050-scale) properties.
    
[SCNNode](https://developer.apple.com/documentation/scenekit/scnnode) > [eulerAngles](https://developer.apple.com/documentation/scenekit/scnnode/1407980-eulerangles): [SCNVector3](https://developer.apple.com/documentation/scenekit/scnvector3)
    
```swift
@property eulerAngles
@abstract Determines the receiver's euler angles. Animatable.
@dicussion The order of components in this vector matches the axes of rotation:
           1. Pitch (the x component) is the rotation about the node's x-axis (in radians)
           2. Yaw   (the y component) is the rotation about the node's y-axis (in radians)
           3. Roll  (the z component) is the rotation about the node's z-axis (in radians)
        SceneKit applies these rotations in the reverse order of the components:
           1. first roll
           2. then yaw
           3. then pitch
```
    
###### [SCNGeometry](https://developer.apple.com/documentation/scenekit/scngeometry)

    Create from built-in primitive shapes: [SCNPlane](https://developer.apple.com/documentation/scenekit/scnplane), 
    [SCNBox](https://developer.apple.com/documentation/scenekit/scnbox), 
    [SCNSphere](https://developer.apple.com/documentation/scenekit/scnsphere), 
    [Built-in Geometry Types](https://developer.apple.com/documentation/scenekit/built_in_geometry_types)
    
    Create from text: [SCNText](https://developer.apple.com/documentation/scenekit/scntext)
    
    

```swift
@IBOutlet weak var scnView: SCNView!

override func viewDidLoad() {
  super.viewDidLoad()
  
  scnView.allowsCameraControl = true
  scnView.autoenablesDefaultLighting = true
  scnView.showsStatistics = true

  let scene = SCNScene()
  scnView.scene = scene

  let box = SCNBox(width: 1.0, height: 1.0, length: 1.0, chamferRadius: 0.0)
  let node = SCNNode(geometry: box)
  scene.rootNode.addChildNode(node)

  let cameraNode = SCNNode()
  cameraNode.camera = SCNCamera()
  cameraNode.position = SCNVector3(x: 0, y: 0, z: 10)
  scene.rootNode.addChildNode(cameraNode)
}
```

#### Render Loop

- [SCNSceneRendererDelegate](https://developer.apple.com/documentation/scenekit/scnscenerendererdelegate)

```swift
scnView.delegate = self
scnView.isPlaying = true

extension ViewController: SCNSceneRendererDelegate {
    func renderer(_ renderer: SCNSceneRenderer, didRenderScene scene: SCNScene, atTime time: TimeInterval) {
        // add per-frame game logic
    }
}
```

#### Timer

```swift
var spawnTime: TimeInterval = 0
func spawnShape() {
    print("spawnShape")
}

func renderer(_ renderer: SCNSceneRenderer, didRenderScene scene: SCNScene, atTime time: TimeInterval) {
    if time > spawnTime {
        spawnShape()
        spawnTime = time + TimeInterval(1)
    }
}
```

#### Action

- [SCNAction](https://developer.apple.com/documentation/scenekit/scnaction)

