//
//  HomeViewModel.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 18/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI
import Combine

class HomeViewModel: ObservableObject {
    // MARK: - Published Properties
    @Published var menuItems: [AnimationItem] = []
    
    init() {
        loadAnimations()
    }
    
    // MARK: - Private Logic
    private func loadAnimations() {
        self.menuItems = [
            AnimationItem(
                name: "Morphing Button",
                description: "Button to loader with Success/Fail states",
                icon: "arrow.right.circle.fill",
                destination: AnyView(MorphingButtonUse(title: "Morphing Button"))
            ),
            AnimationItem(
                name: "Staggered List",
                description: "Items slide up with a cascading fade effect",
                icon: "text.alignleft",
                destination: AnyView(StaggeredListItemUse(title: "Staggered List"))
            )
        ]
    }
}
