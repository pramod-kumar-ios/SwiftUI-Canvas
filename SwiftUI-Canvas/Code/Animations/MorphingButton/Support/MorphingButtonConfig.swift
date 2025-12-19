//
//  MorphingButtonConfig.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 18/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

struct MorphingButtonConfig {
    // Visual
    var title: String? = "Submit"
    
    // Icons
    var successIcon: Image = Image(systemName: "checkmark")
    var failureIcon: Image = Image(systemName: "xmark")
    
    // Font
    var titleFont: Font = .system(size: 20, weight: .bold)
    var successFont: Font = .system(size: 20, weight: .bold)
    var failureFont: Font = .system(size: 20, weight: .bold)
    
    // Colors
    var idleColor: Color = .blue
    var loadingColor: Color = .blue
    var successColor: Color = .green
    var failureColor: Color = .red
    var progressTintColor: Color = .white
    var foregroundColor: Color = .white
    
    // Dimensions
    var height: CGFloat = 50
    var width: CGFloat? = 150
    var collapsedWidth: CGFloat = 50
    var cornerRadius: CGFloat = 25
    
    // Animation Durations
    var springDamping: Double = 0.6
    var response: Double = 0.4
}
