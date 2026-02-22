//
//  FABOption.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 22/02/26.
//

import SwiftUI

struct FABOption: Identifiable {
    let id = UUID()
    let title: String?
    let icon: String?
    let color: Color
    let action: () -> Void
}
