//
//  ImmersiveView.swift
//  Manipulatives
//
//  Created by John Haney on 6/11/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ImmersiveView: View {

    var body: some View {
        RealityView { content in
            // Add the initial RealityKit content
            if let immersiveContentEntity = try? await Entity(named: "Immersive", in: realityKitContentBundle) {
                content.add(immersiveContentEntity)

                guard let group = immersiveContentEntity.findEntity(named: "Manipulatives")
                else { return }
                
                for child in group.children {
                    ManipulationComponent.configureEntity(child)
                    child.components[ManipulationComponent.self]?.releaseBehavior = .stay
                }
            }
        }
    }
}
