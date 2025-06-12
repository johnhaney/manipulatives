# Manipulatives

Sample visionOS 26 project demonstrating ManipulationComponent applied to entities within a Reality Composer Pro scene. 

In the Window:
```
    guard let group = immersiveContentEntity.findEntity(named: "Manipulatives")
    else { return }
    
    for child in group.children {
        ManipulationComponent.configureEntity(child)
    }
```

In the Mixed Immersion Scene:
```
    guard let group = immersiveContentEntity.findEntity(named: "Manipulatives")
    else { return }
    
    for child in group.children {
        ManipulationComponent.configureEntity(child)
        child.components[ManipulationComponent.self]?.releaseBehavior = .stay
    }
```

Also, this scene uses the coexist behavior, which allows a mixed immersive space to present within an environment the user has selected:
```
.immersiveEnvironmentBehavior(.coexist)
```

