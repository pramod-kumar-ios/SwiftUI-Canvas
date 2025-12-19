//
//  AnimationItem.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 18/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

struct AnimationItem: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let icon: String
    let destination: AnyView
}
