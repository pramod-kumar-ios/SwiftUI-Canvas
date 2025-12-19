//
//  StaggeredListItemUse.swift
//  SwiftUI-Canvas
//
//  Created by Pramod Kumar on 19/12/25.
//  Copyright © 2025 Pramod Kumar. All rights reserved.
//

import SwiftUI

struct StaggeredListItemUse: View {
    
    let title: String
    @StateObject private var viewModel = StaggeredListItemUseViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVStack(spacing: 16) {
                    ForEach(Array(viewModel.items.enumerated()), id: \.offset) { index, item in
                        StaggeredListItem(index: index) {
                            CardView(title: item)
                        }
                    }
                }
                .padding()
            }
            .onAppear {
                viewModel.loadData()
            }
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct CardView: View {
    let title: String
    
    var body: some View {
        Text(title) // Fixed: Use standard SwiftUI Text
            .font(.headline)
            .foregroundColor(.primary)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            .background(Color(.secondarySystemBackground))
            .cornerRadius(12)
            .shadow(color: .black.opacity(0.05), radius: 5, x: 0, y: 2)
    }
}
