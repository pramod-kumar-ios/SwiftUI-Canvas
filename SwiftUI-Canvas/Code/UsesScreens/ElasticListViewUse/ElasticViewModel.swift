//
//  ElasticViewModel.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 20/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI
import Combine

struct DemoModel: ElasticItem {
    let id = UUID()
    let title: String
    let color: Color
}

class ElasticViewModel: ObservableObject {
    @Published var items = [
        DemoModel(title: "Stretch Me", color: .purple),
        DemoModel(title: "Card 2", color: .blue),
        DemoModel(title: "Card 3", color: .green),
        DemoModel(title: "Card 4", color: .orange)
    ]
}
