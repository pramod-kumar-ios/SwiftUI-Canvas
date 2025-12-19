//
//  ShakeEffect.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 18/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

// MARK: - Shake Animation Logic
struct ShakeEffect: GeometryEffect {
    var animatableData: CGFloat
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        // Creates a rhythmic horizontal offset
        ProjectionTransform(CGAffineTransform(translationX: 10 * sin(animatableData * .pi * 3), y: 0))
    }
}
