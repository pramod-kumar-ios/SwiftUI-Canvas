//
//  StaggeredListItem.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 19/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

struct StaggeredListItem<Content: View>: View {
    let index: Int
    let config: StaggerConfig
    let content: Content
    
    @State private var isVisible = false
    
    init(index: Int, config: StaggerConfig = StaggerConfig(), @ViewBuilder content: () -> Content) {
        self.index = index
        self.config = config
        self.content = content()
    }
    
    var body: some View {
        content
            .opacity(isVisible ? 1 : 0)
            .offset(y: isVisible ? 0 : config.slideOffset)
            .onAppear {
                let delay = config.baseDelay + (Double(index) * config.delayStep)
                withAnimation(config.animation.delay(delay)) {
                    isVisible = true
                }
            }
    }
}
