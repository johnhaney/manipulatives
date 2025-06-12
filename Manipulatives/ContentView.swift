//
//  ContentView.swift
//  Manipulatives
//
//  Created by John Haney on 6/11/25.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {

    var body: some View {
        VStack {
            RealityView { content in
                if let immersiveContentEntity = try? await Entity(named: "Scene", in: realityKitContentBundle) {
                    content.add(immersiveContentEntity)

                    guard let group = immersiveContentEntity.findEntity(named: "Manipulatives")
                    else { return }
                    
                    for child in group.children {
                        ManipulationComponent.configureEntity(child)
                    }
                }
            }

            Text("Hello, world!")

            ToggleImmersiveSpaceButton()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
        .environment(AppModel())
}
