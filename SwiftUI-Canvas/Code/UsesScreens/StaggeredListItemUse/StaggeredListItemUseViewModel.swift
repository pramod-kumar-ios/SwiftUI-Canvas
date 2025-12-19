//
//  StaggeredListItemUseViewModel.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 19/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI
import Combine

class StaggeredListItemUseViewModel: ObservableObject {
    @Published var items: [String] = []
    
    func loadData() {
        // Simulating a network fetch or data load
        let newItems = (1...30).map { "Dashboard Item #\($0)" }
        self.items = newItems
    }
}
