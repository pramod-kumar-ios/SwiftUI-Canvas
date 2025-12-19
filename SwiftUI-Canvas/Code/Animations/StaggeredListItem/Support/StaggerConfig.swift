//
//  StaggerConfig.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 19/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

struct StaggerConfig {
    var baseDelay: Double = 0.1
    var delayStep: Double = 0.05
    var slideOffset: CGFloat = 30
    var animation: Animation = .spring(response: 0.5, dampingFraction: 0.8)
}
